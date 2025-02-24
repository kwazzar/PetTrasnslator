//
//  BackgroundView.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
   private var background: LinearGradient
   private let content: Content

    init(backgroundColor: LinearGradient = AppColors.backgroundGradient, @ViewBuilder content: () -> Content) {
        self.background = backgroundColor
        self.content = content()
    }

    var body: some View {
        ZStack {
            background
                .edgesIgnoringSafeArea(.all)
            content 
        }
    }
}
