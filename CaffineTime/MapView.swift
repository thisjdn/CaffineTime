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
    
    @State private var showTitle = true
    
    @State private var showDetails = false
    
    var body: some View {
        ZStack {
            NavigationView {
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.places) { places in
                    MapAnnotation(coordinate: places.coordinates) {
                        VStack {
                            Text(MapDetails.testTitle)
                                .font(.callout)
                                .padding(5)
                                .frame(width: 150)
                                .multilineTextAlignment(.center)
                                .background(Color(.white))
                                .cornerRadius(10)
                                .opacity(showTitle ? 0 : 1)
                                .onTapGesture {
                                    print("JADEN: Text tapped. Please trigger details window.")
                                }
                            VStack {
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
 


