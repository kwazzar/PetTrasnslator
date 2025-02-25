//
//  LoadingView.swift
//  PetTrasnslator
//
//  Created by Quasar on 25.02.2025.
//

import SwiftUI

struct LoadingView: View {
    let text: String
    @State private var dotCount = 0
    
    var body: some View {
        VStack {
            Text("\(text)\(dots)")
                .font(.headline)
                .foregroundColor(.primary)
                .onAppear {
                    startDotAnimation()
                }
        }
    }
    
    private var dots: String {
        String(repeating: ".", count: (dotCount % 4))
    }
    
    private func startDotAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            withAnimation {
                dotCount += 1
            }
        }
    }
}
