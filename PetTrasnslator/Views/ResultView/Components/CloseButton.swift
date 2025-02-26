//
//  CloseButton.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct CloseButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            Image("closeIcon")
                .frame(width: 28, height: 28)
                .frame(width: 48, height: 48)
                .background(AppColors.objectColor)
                .cornerRadius(25)
        }
        .buttonStyle(BounceButtonStyle())
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(action: {})
    }
}
