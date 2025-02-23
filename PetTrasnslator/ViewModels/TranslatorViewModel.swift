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
    @Published var selectedMenu: MenuButtons = .translator
    
}
