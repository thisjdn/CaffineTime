//
//  ContentView.swift
//  CaffineTime
//
//  Created by Jaden Hong on 2023-01-30.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    @State private var showTitle = true
    
    @State private var showDetails = false
    
    var dataManager = DataManager()
    
    var body: some View {
        ZStack {
            NavigationView {
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.pins) { places in
                    MapAnnotation(coordinate: places.coordinates) {
                        VStack {    // Pin & InfoBox
                            Text(MapDetails.testTitle)
                                .font(.callout)
                                .padding(5)
                                .frame(width: 150)
                                .multilineTextAlignment(.center)
                                .background(Color(.white))
                                .cornerRadius(10)
                                .opacity(showTitle ? 0 : 1)
                            VStack {    // Pin
                                Image(systemName: MapDetails.mapPinCircleFill)
                                    .font(.title)
                                    .foregroundColor(.red)
                                Image(systemName: MapDetails.arrowTriangleDownFill)
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .offset(x: 0, y: -5)
                            }
                            .onTapGesture {
                                withAnimation() {
                                    showTitle.toggle()
                                    print("JADEN: Pin tapped.")
                                }
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .tint(Color(.systemBlue))
                .onAppear {
                    DispatchQueue.main.async {
                        viewModel.checkIfLocationServicesIsEnabled()
                    }
                }
            }
            .searchable(text: $viewModel.searchText, placement: .automatic)
            .onSubmit(of: .search) {
                self.viewModel.submitCurrentSearchQuery() 
            }
//            current location button
            LocationButton(.currentLocation) {
                // Recenter map to current location.
                print("current location button pressed")
                viewModel.checkIfLocationServicesIsEnabled()
            }
            .symbolVariant(.fill)
            .labelStyle(.iconOnly)
            .cornerRadius(10)
            .alignmentGuide(VerticalAlignment.center) { context in
                -(context.height*8)
            }
            .alignmentGuide(HorizontalAlignment.center) { context in
                -(context.width*3)
            }
            .colorInvert()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
 
 



