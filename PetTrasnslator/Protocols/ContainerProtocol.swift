//
//  ContainerProtocol.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import Foundation

protocol ContainerProtocol {
    func createTranslatorViewModel() -> TranslatorViewModel
    func createResultViewModel(from translatorViewModel: TranslatorViewModel) -> ResultViewModel
    func createSettingsViewModel() -> SettingsViewModel
}
