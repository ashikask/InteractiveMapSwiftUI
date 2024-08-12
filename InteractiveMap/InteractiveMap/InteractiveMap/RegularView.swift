//
//  RegularView.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI
import MapKit

struct RegularView: View {
    @Binding var showDetailView: Bool
    @Binding var region: MapCameraPosition
    @Binding var mapCoordinate: CLLocationCoordinate2D
    @Binding var selectedLocation: LocationType?
    @Binding var showPopover: Bool
    @ObservedObject var viewmodel: MapAddressViewModel
    
    var body: some View {
        HStack(spacing: 40) {
            VStack {
                LocationInfoView(showDetailView: $showDetailView, selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewmodel)
                    
                
                
                ToggleDetailButton(showDetailView: $showDetailView, showPopover: $showPopover)
            }
           
            MapOrImageView(showDetailView: $showDetailView, region: $region, mapCoordinate: $mapCoordinate, selectedLocation: $selectedLocation)
               
                .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.height)
        }
    }
}

struct RegularView_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    @State static var mapCoordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)
    @State static var selectedLocation: LocationType? = .street
    @State static var showPopover = false
    @StateObject static var viewmodel = MapAddressViewModel()

    static var previews: some View {
        RegularView(
            showDetailView: $showDetailView,
            region: $region,
            mapCoordinate: $mapCoordinate,
            selectedLocation: $selectedLocation,
            showPopover: $showPopover,
            viewmodel: viewmodel
        )
    }
}
