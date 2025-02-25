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
        BackgroundView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    HeaderView(title: "Translator")
                        .frame(height: geometry.size.height * 0.15)
                        .padding(.top, geometry.size.height * 0.001)

                    stateContentView(geometry: geometry)

                    ImageView(viewModel.selectedPet.image)
                        .frame(height: geometry.size.height * 0.3)
                        .padding(.bottom, geometry.size.height * 0.002)
                    Spacer()
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.navigateToResult, onDismiss: {
            viewModel.state = .idle
        }) {
            ResultView(viewModel: viewModel.createResultViewModel())
        }
    }
}

private extension TranslatorView {
    // MARK: - stateContentView
    @ViewBuilder
    private func stateContentView(geometry: GeometryProxy) -> some View {
        switch viewModel.state {
        case .idle, .recording:
            translatingSettings(geometry: geometry)

        case .translating:
            loadingView(geometry: geometry)
        }
    }
}

// MARK: - loadingView
func loadingView(geometry: GeometryProxy) -> some View {
    VStack {
        Spacer()
            .frame(height: geometry.size.height * 0.03)
            .padding(.top, geometry.size.height * 0.01)
            .padding(.bottom, geometry.size.height * 0.04)
        LoadingView(text: "Process of translation")
            .frame(height: geometry.size.height * 0.25)
            .padding(.vertical, geometry.size.height * 0.01)
    }
}

private extension TranslatorView {
    // MARK: - translating Settings
    func translatingSettings(geometry: GeometryProxy) -> some View {
        return VStack {
            languageSwitch
                .frame(height: geometry.size.height * 0.03)
                .padding(.top, geometry.size.height * 0.01)
                .padding(.bottom, geometry.size.height * 0.04)

            HStack(spacing: 35) {
                MicrophoneButtonView(
                    action: { viewModel.toggleRecording() },
                    audioManager: viewModel.audioManager,
                    showAlert: $viewModel.microphoneAccessShowAlert)
                petSelectMenu
            }
            .frame(height: geometry.size.height * 0.25)
            .padding(.vertical, geometry.size.height * 0.01)
        }
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
}

//MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView(viewModel:
                        TranslatorViewModel(
                            audioManager: AudioRecorderManager()))
    }
}
