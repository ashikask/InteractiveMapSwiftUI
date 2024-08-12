//
//  InteractiveMap.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI
import MapKit

struct InteractiveMap: View {
    
    @StateObject var viewModel = MapAddressViewModel()
    @State private var mapCoordinate = CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)
    @State private var showDetailView = true
    
    @State private var selectedLocation: LocationType?
    @State private var showPopover: Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        Group {
            if horizontalSizeClass == .compact {
                CompactView(showDetailView: $showDetailView, region: $viewModel.region, mapCoordinate: $mapCoordinate, selectedLocation: $selectedLocation, showPopover: $showPopover, viewmodel: viewModel)
            } else {
                RegularView(showDetailView: $showDetailView, region: $viewModel.region, mapCoordinate: $mapCoordinate, selectedLocation: $selectedLocation, showPopover: $showPopover, viewmodel: viewModel)
            }
        }
        .padding(.bottom)
    }

}

#Preview {
    InteractiveMap()
}
