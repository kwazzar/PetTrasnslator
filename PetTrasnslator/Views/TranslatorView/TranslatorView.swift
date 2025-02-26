//
//  TranslatorView.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

struct TranslatorView: View {
    @StateObject var viewModel: TranslatorViewModel
    let container: ContainerProtocol
    
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
            ResultView(viewModel: container.createResultViewModel(from: self.viewModel))
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
    
    // MARK: - translating Settings
    func translatingSettings(geometry: GeometryProxy) -> some View {
        return VStack {
            LanguageSwitch(
                currentLanguage: $viewModel.currentLanguage,
                action: { viewModel.currentLanguage.toggle()
                })
            .frame(height: geometry.size.height * 0.03)
            .padding(.top, geometry.size.height * 0.01)
            .padding(.bottom, geometry.size.height * 0.04)
            
            HStack(spacing: 35) {
                MicrophoneButtonView(
                    action: { viewModel.toggleRecording() },
                    audioManager: viewModel.audioManager,
                    showAlert: $viewModel.microphoneAccessShowAlert)
                PetSelectMenu(viewModel.selectedPet)
            }
            .frame(height: geometry.size.height * 0.25)
            .padding(.vertical, geometry.size.height * 0.01)
        }
    }
}

//MARK: - Preview
struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView(viewModel:
                        TranslatorViewModel(
                            audioManager: AudioRecorderManager(), translator: TranslatorManager()), container: AppConteiner())
    }
}
