//
//  LanguageSwitch.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct LanguageSwitch: View {
    @Binding var currentLanguage: Language
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(currentLanguage.title)
                .font(.konkhmerSleokchher(size: 16))
                .frame(width: 135, height: 61)
            
            Button(action: {
                withAnimation {
                    action()
                }
            }) {
                Image("swapIcon")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, -5)
                    .background(Color.clear)
            }
            .buttonStyle(BounceButtonStyle())
            
            Text(currentLanguage == .human ? Language.pet.title : Language.human.title)
                .font(.konkhmerSleokchher(size: 16))
                .frame(width: 135, height: 61)
        }
        .frame(maxWidth: .infinity)
    }
}

struct LanguageSwitch_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSwitch(currentLanguage: .constant(.human), action: {})
    }
}
