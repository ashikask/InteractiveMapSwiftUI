//
//  BindingExtension.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import Foundation
import SwiftUI

extension Binding where Value == Bool {
    static func &&(_ lhs: Binding<Bool>, _ rhs: Binding<Bool>) -> Binding<Bool> {
        return Binding<Bool>(
            get: { lhs.wrappedValue && rhs.wrappedValue },
            set: { _ in }
        )
    }
}
