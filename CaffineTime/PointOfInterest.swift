//
//  PointOfInterest.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-02-08.
//

import MapKit

struct PointOfInterest : Identifiable {
    
    let id = UUID()
    let name : String
    let latitude : Double
    let longitude : Double
    
    var coordinates : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
