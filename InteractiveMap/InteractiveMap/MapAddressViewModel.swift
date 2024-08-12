//
//  MapAddressViewModel.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import Foundation
import MapKit
import SwiftUI

class MapAddressViewModel: ObservableObject {
    @Published var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    
    func updateMapRegion(for address: String, locationType: LocationType) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let placemarks = placemarks, let location = placemarks.first?.location {
                withAnimation {
                    let newSpan: MKCoordinateSpan
                    
                    switch locationType {
                    case .street:
                        newSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    case .city:
                        newSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                    case .state:
                        newSpan = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
                    case .zipCode:
                        newSpan = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
                    case .country:
                        newSpan = MKCoordinateSpan(latitudeDelta: 40.0, longitudeDelta: 40.0)
                    }
                    
                    self.region = MapCameraPosition.region (MKCoordinateRegion(
                        center: location.coordinate,
                        span: newSpan)
                    )
                }
            } else {
                print("Location not found: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
