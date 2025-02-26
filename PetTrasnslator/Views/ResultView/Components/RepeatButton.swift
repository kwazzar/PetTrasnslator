//
//  RepeatButton.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct RepeatButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            HStack {
                Image("rotateIcon")
                    .frame(width: 16, height: 16)
                Text("Repeat")
                    .font(.konkhmerSleokchher(size: 12))
            }
            .frame(width: 291, height: 54)
            .background(AppColors.responseCloudColor)
            .cornerRadius(16)
        }
        .buttonStyle(BounceButtonStyle())
    }
}

struct RepeatButton_Previews: PreviewProvider {
    static var previews: some View {
        RepeatButton(action: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
