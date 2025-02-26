//
//  SettingsButton.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct SettingsButton: View {
    var action: () -> Void
    let title: String

    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            HStack {
                Text(title)
                    .font(.konkhmerSleokchher(size: 16))
                    .padding(.leading, 15)
                Spacer()
                Image("settingArrowIcon")
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 15)

            }
            .frame(width: 358, height: 50)
            .background(AppColors.responseCloudColor)
            .cornerRadius(16)
        }
        .buttonStyle(BounceButtonStyle())
        .padding(.bottom, 5)
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton(action: {}, title: Settings.contactUs.title)
    }
}
