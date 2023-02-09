//
//  ContentView.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-01-30.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
//                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.places) { places in
//                    MapMarker(coordinate: places.coordinates)
//                }
                
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
                .searchable(text: $viewModel.searchText, placement: .automatic)
                .tint(Color(.systemBlue))
                .onAppear {
                    viewModel.checkIfLocationServicesIsEnabled()
                }
            }
        } 
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

