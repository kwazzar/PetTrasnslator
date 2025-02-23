//
//  ButtonStyle.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

import SwiftUI

struct BounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: configuration.isPressed)
    }
}
