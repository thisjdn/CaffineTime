//
//  MapViewModel.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-02-09.
//

import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 43.6426, longitude: -79.3871)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
    static let mapPinCircleFill = "mappin.circle.fill"
    static let arrowTriangleDownFill = "arrowtriangle.down.fill"
    static let testTitle = "Location Name"
    
    static let testUrl = "https://api.geoapify.com/v2/places?categories=catering.cafe.coffee&filter=circle:-0.07071648508463113,51.50848194136378,1000&bias=proximity:-0.07071648508463113,51.50848194136378&limit=20&apiKey=330e488f5d1c421697918a9db7281ce0"
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
    
    private var locationOn : Bool {
        CLLocationManager.locationServicesEnabled()
    }
    
    func checkIfLocationServicesIsEnabled() {
        if self.locationOn {
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self
        } else {
            print("Location Services must be Enabled. Show an alert indicating so.")
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
                let lon = safeLocation.coordinate.longitude
                let lat = safeLocation.coordinate.latitude
                print("lon: \(lon), lat: \(lat)")
                print("updated current location")
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
    
    func submitCurrentSearchQuery() {
//        Return key -> searchBar
        print(searchText.lowercased())
        
        
        
    }
    
    
    
}

