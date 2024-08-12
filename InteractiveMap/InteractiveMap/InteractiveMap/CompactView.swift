//
//  CompactView.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI
import MapKit

struct CompactView: View {
    @Binding var showDetailView: Bool
    @Binding var region: MapCameraPosition
    @Binding var mapCoordinate: CLLocationCoordinate2D
    @Binding var selectedLocation: LocationType?
    @Binding var showPopover: Bool
    @ObservedObject var viewmodel: MapAddressViewModel
    var body: some View {
        VStack(spacing: 20) {
            MapOrImageView(showDetailView: $showDetailView, region: $region, mapCoordinate: $mapCoordinate, selectedLocation: $selectedLocation)
                .frame(width: UIScreen.main.bounds.width , height: 400)
            
            LocationInfoView(showDetailView: $showDetailView, selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewmodel)
            
            Spacer()
            
            ToggleDetailButton(showDetailView: $showDetailView, showPopover: $showPopover)
        }
    }
}

struct CompactView_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    @State static var mapCoordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)
    @State static var selectedLocation: LocationType? = .street
    @State static var showPopover = false
    @StateObject static var viewmodel = MapAddressViewModel()

    static var previews: some View {
        CompactView(
            showDetailView: $showDetailView,
            region: $region,
            mapCoordinate: $mapCoordinate,
            selectedLocation: $selectedLocation,
            showPopover: $showPopover,
            viewmodel: viewmodel
        )
    }
}

