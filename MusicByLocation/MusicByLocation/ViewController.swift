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
        getArtists()
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
                        self.musicRecommendations.text = self.getLocationBreakdown(placemark: firstPlacemark)
                
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
    
    func getLocationBreakdown(placemark: CLPlacemark) -> String {
        return """
        Country:  \(placemark.country ?? "None")
        State:   \(placemark.administrativeArea ?? "None")
        County:   \(placemark.subAdministrativeArea ?? "None")
        City:   \(placemark.locality ?? "None")
        Street:  \(placemark.thoroughfare ?? "None")
        """
    }
    
    func getArtists() -> String {
        guard let url = URL(string: "https://itunes.apple.com/search?term=Lionel%20Ritchie&entity=musicArtist")
            else {
                print("Invalid URL")
                return "Invalid URL. Wasn't able to search iTunes"
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                print(String(decoding: data, as: UTF8.self))
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

