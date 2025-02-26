//
//  ResultViewModel.swift
//  PetTrasnslator
//
//  Created by Quasar on 24.02.2025.
//

import SwiftUI

final class ResultViewModel: ObservableObject {
    @Published var selectedPet: Pet = .dog
    @Published var hasTranslation: Bool = false
    @Published var translationText: String = ""

    func closeResult(completion: @escaping () -> Void) {
        hasTranslation = false
        translationText = ""

        completion()
    }
    
    func fetchTranslation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hasTranslation = true
        }
    }
}
