//
//  LocationType.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import Foundation

enum LocationType {
    case street
    case city
    case state
    case zipCode
    case country
    
    var description: String {
        switch self {
        case .street:
            return "Street"
        case .city:
            return "City"
        case .state:
            return "State"
        case .zipCode:
            return "ZIP Code"
        case .country:
            return "Country"
        }
    }
}
