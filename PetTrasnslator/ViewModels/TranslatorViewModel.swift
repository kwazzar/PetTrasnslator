//
//  TranslatorViewModel.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

import SwiftUI

final class TranslatorViewModel: ObservableObject {
    @Published var selectedPet: Pet = .dog
    @Published var currentLanguage: Language = .human
    @Published var audioManager: AudioRecorderManager
    @Published var microphoneAccessShowAlert = false
    @Published var state: TranslatorState = .idle
    @Published var navigateToResult = false
    @Published var translationText: String = ""

    private let translator: TranslatorManager

    init(audioManager: AudioRecorderManager, translator: TranslatorManager) {
        self.audioManager = audioManager
        self.translator = translator
    }

    func toggleRecording() {
        audioManager.requestMicrophonePermission { [weak self] granted in
            guard let self = self else { return }

            if granted {
                switch self.state {
                case .idle:
                    self.audioManager.startRecording()
                    self.state = .recording

                case .recording:
                    self.audioManager.stopRecording()
                    self.state = .translating
                    self.translateText()

                case .translating:
                    self.state = .idle
                }
            } else {
                self.microphoneAccessShowAlert = true
            }
        }
    }

    private func translateText() {
        let translated = translator.translate(
            from: currentLanguage,
            to: currentLanguage.toggled(),
            pet: selectedPet
        )

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.translationText = translated
            self.navigateToResult = true
        }
    }

    func createResultViewModel() -> ResultViewModel {
        let resultViewModel = ResultViewModel()
        resultViewModel.selectedPet = self.selectedPet
        resultViewModel.hasTranslation = true
        resultViewModel.translationText = self.translationText
        return resultViewModel
    }
}
