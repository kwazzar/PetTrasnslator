//
//  GeneralMenu.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct GeneralMenu: View {
    @State var selectedMenu: MenuButtons

    var body: some View {
        HStack(spacing: 50) {
            ForEach(MenuButtons.allCases, id: \.self) { menu in
                Button(action: {
                    print("Кнопка \(menu.title) натиснута!")
                }) {
                    VStack {
                        Image(menu.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .background(Color.clear)
                            .offset(y: 8)
                        Text(menu.title)
                            .font(.konkhmerSleokchher(size: 12))
                            .foregroundColor(.black)
                    }
                    .opacity(selectedMenu == menu ? 1.0 : 0.5)
                }
                .buttonStyle(BounceButtonStyle())
            }
        }
        .frame(width: 216, height: 82)
        .background(AppColors.objectColor)
        .cornerRadius(16)
    }
}
