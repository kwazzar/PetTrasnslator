//
//  SettingsView.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        BackgroundView {
            GeometryReader { geometry in
                VStack {
                    HeaderView(title: "Settings")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
