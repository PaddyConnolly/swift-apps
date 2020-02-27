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
                    if let placemarks = placemarks{
                        self.musicRecommendations.text =   """
                        Country:  \(placemarks[0].country!)
                        State:   \(placemarks[0].administrativeArea!)
                        County:   \(placemarks[0].subAdministrativeArea!)
                        City:   \(placemarks[0].locality!)
                        Street:  \(placemarks[0].thoroughfare!)
                        """
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }
}

