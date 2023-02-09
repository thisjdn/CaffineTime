//
//  PointOfInterest.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-02-08.
//

import MapKit

struct PointOfInterest : Identifiable {
    
    var id = UUID()
    var name : String
    var latitude : Double
    var longitude : Double
    
    
    var coordinates : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
