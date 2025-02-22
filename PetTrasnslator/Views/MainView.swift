//
//  MainView.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        BackgroundView(backgroundColor: AppColors.backgroundGradient) {
            VStack {
                header
                HStack {
#warning("type selector")

                }
                HStack(spacing: 35) {
#warning("buttons")
                    microfoneButton
                    VStack {
                        

                    }
                    .frame(width: 107, height: 176)
                    .background(AppColors.objectColor)
                    .cornerRadius(16)
                }
#warning("imageview")
                Spacer()
#warning("menu")
            }
        }
    }
}

//MARK: - Extension
private extension MainView {
    var header: some View {
        Text("Translator")
            .font(.konkhmerSleokchher(size: 32))
            .padding(.top, 40)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.clear)
            .padding(.horizontal)
    }

    var microfoneButton: some View {
        Button(action: {
            print("Кнопка натиснута!")
        }) {
            VStack(spacing: 20) {
                Image("microphoneIcon")
                    .frame(width: 70, height: 70)
                    .padding(.top, 20)
                Text("Start Speak")
                    .font(.konkhmerSleokchher(size: 16))
                    .foregroundColor(.black)
                    .padding(.bottom, -15)
            }
            .frame(width: 178, height: 176)
            .background(AppColors.objectColor)
            .cornerRadius(16)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
