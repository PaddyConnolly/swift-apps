//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Connolly, Patrick (IRG) on 27/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()

    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }

    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.musicRecommendations.text = "Could not perform lookup of location for latitude \(firstLocation.coordinate.latitude.description)"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        if var locality = firstPlacemark.subLocality {
                            locality = locality.replacingOccurrences(of: " ", with: "%20")
                            self.musicRecommendations.text = self.getArtists(query: locality)

                        }
                    
                
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
  
    
    func getArtists(query: String) -> String {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(query)&entity=musicArtist")
            else {
                print("Invalid URL")
                print(query)
                return "Invalid URL. Wasn't able to search iTunes"
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", ")

                    }
                }
            }
        }.resume()
        
        return ""

    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }

        
    }
    
}

