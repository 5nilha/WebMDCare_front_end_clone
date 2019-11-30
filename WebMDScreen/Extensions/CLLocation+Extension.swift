//
//  CLLocation+Extension.swift
//  WebMDScreen
//
//  Created by Fabio Quintanilha on 11/29/19.
//  Copyright © 2019 FabioQuintanilha. All rights reserved.
//

import UIKit
import CoreLocation

extension CLLocationCoordinate2D {
    func getAddressFromCoordinate(completion: @escaping (CLPlacemark?, Error?) -> ()) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat = self.latitude
        let lon = self.longitude
        
        let geocoder: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon

        let location: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)

        geocoder.reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                    completion(nil, error)
                }
                let pm = placemarks! as [CLPlacemark]

                if pm.count > 0 {
                    let pm = placemarks![0]
                    completion(pm, nil)
              }
            
        })
    }
    
    func getDistanceFromLocation(coordinate: CLLocationCoordinate2D) -> Double {
        let sourceCoordinate = CLLocation(latitude: self.latitude, longitude: self.longitude)
        let destination = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let distance = self.meterToMiles(meters: sourceCoordinate.distance(from: destination))
        
        return distance
    }
    
    private func meterToMiles(meters: Double) -> Double {
        return meters / 1609.34
    }
}
