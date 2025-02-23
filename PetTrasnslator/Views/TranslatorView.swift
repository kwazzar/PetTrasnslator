//
//  TranslatorView.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    @StateObject var viewModel: TranslatorViewModel

    var body: some View {
        BackgroundView(backgroundColor: AppColors.backgroundGradient) {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    header
                        .frame(height: geometry.size.height * 0.15)
                        .padding(.top, geometry.size.height * 0.001)

                    languageSwitch
                        .frame(height: geometry.size.height * 0.03)
                        .padding(.top, geometry.size.height * 0.01)
                        .padding(.bottom, geometry.size.height * 0.04)

                    HStack(spacing: 35) {
                        microfoneButton
                        petSelectMenu
                    }
                    .frame(height: geometry.size.height * 0.25)
                    .padding(.vertical, geometry.size.height * 0.01)

                    imageView
                        .frame(height: geometry.size.height * 0.3)
                        .padding(.bottom, geometry.size.height * 0.002)
                    Spacer()
                }
            }
        }
    }
}

private extension TranslatorView {
    // MARK: - Header
    var header: some View {
        Text("Translator")
            .font(.konkhmerSleokchher(size: 37))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.clear)
            .frame(height: 58)
    }

    // MARK: - Language Switch
    var languageSwitch: some View {
        HStack {
            Text(viewModel.currentLanguage.title)
                .font(.konkhmerSleokchher(size: 16))
                .frame(width: 135, height: 61)

            Button(action: {
                withAnimation {
                    viewModel.currentLanguage.toggle()
                }
            }) {
                Image("swapIcon")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.horizontal, -5)
                    .background(Color.clear)
            }
            .buttonStyle(BounceButtonStyle())

            Text(viewModel.currentLanguage == .human ? Language.pet.title : Language.human.title)
                .font(.konkhmerSleokchher(size: 16))
                .frame(width: 135, height: 61)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Microphone Button
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
        .buttonStyle(BounceButtonStyle())
    }

    // MARK: - Pet Select Menu
    var petSelectMenu: some View {
        VStack(spacing: 12) {
            ForEach(Pet.allCases, id: \.self) { animal in
                Button(action: {
                    withAnimation {
                        viewModel.selectedPet = animal
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
                .opacity(viewModel.selectedPet == animal ? 1.0 : 0.5)
                .buttonStyle(BounceButtonStyle())
            }
        }
        .frame(width: 107, height: 176)
        .background(AppColors.objectColor)
        .cornerRadius(16)
    }

    // MARK: - Image View
    var imageView: some View {
        Image(viewModel.selectedPet.image)
            .resizable()
            .scaledToFit()
            .frame(width: 184, height: 184)
            .background(Color.clear)
    }

    // MARK: - General Menu
    var generalMenu: some View {
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
                    .opacity(viewModel.selectedMenu == menu ? 1.0 : 0.5)
                }
                .buttonStyle(BounceButtonStyle())
            }
        }
        .frame(width: 216, height: 82)
        .background(AppColors.objectColor)
        .cornerRadius(16)
    }
}

//MARK: Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView(viewModel: TranslatorViewModel())
    }
}
