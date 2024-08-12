//
//  MapOrImageView.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI
import MapKit

struct MapOrImageView: View {
    @Binding var showDetailView: Bool
    @Binding var region: MapCameraPosition
    @Binding var mapCoordinate: CLLocationCoordinate2D
    @Binding var selectedLocation: LocationType?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        Group {
            if showDetailView == false {
                Map(position: $region){
                    if selectedLocation != nil {
                        Annotation("Apple Park", coordinate: mapCoordinate) {
                            Image(systemName: "apple.logo")
                                .font(.largeTitle)
                                .foregroundStyle(.linearGradient(colors: [.red, .purple], startPoint: .top, endPoint: .bottomTrailing))
                            
                                .phaseAnimator([0, 1]) { content, phase in
                                    content.scaleEffect(selectedLocation == .street ? phase : 1)
                                }
                            
                        }
                    }
                }
                .frame(width: horizontalSizeClass == .compact ? UIScreen.main.bounds.width : UIScreen.main.bounds.width * 0.6, height: horizontalSizeClass == .compact ?  400 : UIScreen.main.bounds.height)
                .ignoresSafeArea()
                .transition(.opacity)
                
            } else {
                Image("applepark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: horizontalSizeClass == .compact ? UIScreen.main.bounds.width : UIScreen.main.bounds.width * 0.6, height: horizontalSizeClass == .compact ?  400 : UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
        }
    }
}

struct MapOrImageView_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    @State static var mapCoordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)
    @State static var selectedLocation: LocationType? = .street
    @StateObject static var viewmodel = MapAddressViewModel()

    static var previews: some View {
        MapOrImageView(
            showDetailView: $showDetailView,
            region: $region,
            mapCoordinate: $mapCoordinate,
            selectedLocation: $selectedLocation
        )
    }
}
