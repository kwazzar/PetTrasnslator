//
//  MenuButtons.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

enum MenuButtons: String, CaseIterable {
    case translator
    case setting

    var title: String {
        switch self {
        case .translator:
            return "Translator"
        case .setting:
            return "Setting"
        }
    }

    var image: String {
        switch self {
        case .translator:
            return "translatorIcon"
        case .setting:
            return "settingIcon"
        }
    }
}
