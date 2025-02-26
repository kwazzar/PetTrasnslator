//
//  PetSelectMenu.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct PetSelectMenu: View {
    @Binding var selectedPet: Pet
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(Pet.allCases, id: \.self) { animal in
                Button(action: {
                    withAnimation {
                        selectedPet = animal
                    }
                }) {
                    Image(animal.image)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(15)
                        .background(animal.color)
                        .cornerRadius(12)
                }
                .frame(width: 70, height: 70)
                .opacity(selectedPet == animal ? 1.0 : 0.5)
                .buttonStyle(BounceButtonStyle())
            }
        }
        .frame(width: 107, height: 176)
        .background(AppColors.objectColor)
        .cornerRadius(16)
    }
}

struct PetSelectMenu_Previews: PreviewProvider {
    static var previews: some View {
        PetSelectMenu(selectedPet: .constant(.dog))
    }
}
