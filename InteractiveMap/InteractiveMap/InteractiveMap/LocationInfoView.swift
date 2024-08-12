//
//  LocationInfoView.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI

struct LocationInfoView: View {
    @Binding var showDetailView: Bool
    @Binding var selectedLocation: LocationType?
    @Binding var showPopover: Bool
    @ObservedObject var viewModel: MapAddressViewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        VStack(alignment: showDetailView ? .leading : .center) {
            if showDetailView == false {
                VStack(alignment: .center) {
                    LocationTextView(text: "One Apple Park Way,", locationType: .street, address: "One Apple Park Way, Cupertino, CA, 95014, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewModel)
                    
                    HStack {
                        LocationTextView(text: "Cupertino,", locationType: .city, address: "Cupertino, CA, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewModel)
                        LocationTextView(text: "CA,", locationType: .state, address: "California, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewModel)
                        LocationTextView(text: "95014,", locationType: .zipCode, address: "95014, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewModel)
                    }
                    
                    LocationTextView(text: "United States", locationType: .country, address: "United States", selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewModel)
                }
                .frame(width: horizontalSizeClass == .compact ? UIScreen.main.bounds.width : UIScreen.main.bounds.width * 0.5)
            } else {
                VStack(alignment:.leading) {
                    LocationDetailTextView(text: "One Apple Park Way", locationType: .street, address: "One Apple Park Way, Cupertino, CA, 95014, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewModel)
                    LocationDetailTextView(text: "Cupertino", locationType: .city, address: "Cupertino, CA, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewModel)
                    LocationDetailTextView(text: "CA", locationType: .state, address: "California, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewModel)
                    LocationDetailTextView(text: "95014", locationType: .zipCode, address: "95014, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewModel)
                    LocationDetailTextView(text: "United States", locationType: .country, address: "United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewModel)
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
        
        .animation(.easeInOut(duration: 0.5), value: showDetailView)
    }
}

struct LocationInfoView_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var selectedLocation: LocationType? = .street
    @State static var showPopover = false
    @StateObject static var viewmodel = MapAddressViewModel()

    static var previews: some View {
        LocationInfoView(showDetailView: $showDetailView, selectedLocation: $selectedLocation, showPopover: $showPopover, viewModel: viewmodel)
    }
}
