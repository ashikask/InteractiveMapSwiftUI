//
//  ToggleDetailButton.swift
//  InteractiveMap
//
//  Created by ashika kalmady on 8/12/24.
//

import SwiftUI

struct ToggleDetailButton: View {
    @Binding var showDetailView: Bool
    @Binding var showPopover: Bool
    
    var body: some View {
        Button("Show Detail") {
            withAnimation(.easeInOut(duration: 0.5)) {
                showPopover = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    showPopover = true
                    showDetailView.toggle()
                }
            }
        }
        .padding()
        .buttonStyle(.bordered)
    }
}

struct ToggleDetailButton_Previews: PreviewProvider {
    @State static var showDetailView = false
    @State static var showPopover = false

    static var previews: some View {
        ToggleDetailButton(showDetailView: $showDetailView,  showPopover: $showPopover)
    }
}

