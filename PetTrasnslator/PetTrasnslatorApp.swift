//
//  PetTrasnslatorApp.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

@main
struct PetTrasnslatorApp: App {
    private let translator = TranslatorManager.shared

    var body: some Scene {
        WindowGroup {
            TranslatorView(viewModel: TranslatorViewModel(audioManager: AudioRecorderManager(), translator: translator))
        }
    }
}
