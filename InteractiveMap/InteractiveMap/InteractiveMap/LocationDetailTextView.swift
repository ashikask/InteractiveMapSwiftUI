//
//  LocationDetailTextView.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI

struct LocationDetailTextView: View {
    let text: String
    let locationType: LocationType
    let address: String
    @Binding var selectedLocation: LocationType?
    @Binding var showPopover: Bool
    @Binding var showDetailView: Bool
    @ObservedObject var viewModel: MapAddressViewModel
    var body: some View {
        Text(locationType.description)
            .font(.subheadline)
            .foregroundColor(.gray)
            .transition(.move(edge: .leading).combined(with: .opacity)) // Transition for description text
        
        Text(text)
            .font(.largeTitle)
            .foregroundColor(selectedLocation == locationType ? .blue : .primary)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showPopover = false // Close the previous popover
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Small delay to ensure animation
                        selectedLocation = locationType
                        showPopover = true
                        showDetailView.toggle()
                        viewModel.updateMapRegion(for: address, locationType: locationType)
                    }
                }
            }
            .popover(isPresented: $showPopover && Binding(get: { selectedLocation == locationType }, set: { _ in }), attachmentAnchor: .point(.center)) {
                Text(locationType.description)
                    .presentationCompactAdaptation(.popover)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .transition(.move(edge: .trailing).combined(with: .opacity))
        // Transition for main text
            .animation(.easeInOut(duration: 0.5), value: selectedLocation)
    }
}

struct LocationDetailTextView_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var selectedLocation: LocationType? = .street
    @State static var showPopover = false
    @StateObject static var viewmodel = MapAddressViewModel()

    static var previews: some View {
        LocationDetailTextView(text: "One Apple Park Way", locationType: .street, address: "One Apple Park Way, Cupertino, CA, 95014, United States", selectedLocation: $selectedLocation, showPopover: $showPopover, showDetailView: $showDetailView, viewModel: viewmodel)
    }
}
