//
//  MapViewModel.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-02-09.
//

import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    static let mapPinCircleFill = "mappin.circle.fill"
    static let arrowTriangleDownFill = "arrowtriangle.down.fill"
    static let testTitle = "Location Name"
}
 


class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var searchText = ""
    @Published var region = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan
    )
    
    var pins : [PointOfInterest] = []
    
    let places = [      //test locations 1
        PointOfInterest(name: "Testing", latitude: 37.3646, longitude: -122.0390),
        PointOfInterest(name: "Testing", latitude: 37.3046, longitude: -122.0690),
        PointOfInterest(name: "Testing", latitude: 37.3346, longitude: -121.9594)
    ]
    
    
    var locationManager : CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        DispatchQueue.main.async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager = CLLocationManager()
                self.locationManager?.delegate = self
            } else {
                print("Location Services must be Enabled. Show an alert indicating so.")
            }
        }
        
    }
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("The app is not authorized to use location services.")
        case .denied:
            print("User denied the use of location services for the app or they are disabled globally in Settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            if let safeLocation = locationManager.location {
                region = MKCoordinateRegion(center: safeLocation.coordinate, span: MapDetails.defaultSpan)
            } else {
                print("Unexpectedly found nil while unwrapping locationManager.location")
            }
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
    
}
