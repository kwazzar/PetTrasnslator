//
//  TranslationManager.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

final class TranslatorManager: TranslateProtocol {
    static let shared = TranslatorManager()

    func translate(from source: Language, to destination: Language, pet: Pet) -> String {
        switch (source, destination) {
        case (.human, .pet):
            return translateHumanToPet(pet: pet)
        case (.pet, .human):
            return translatePetToHuman()
        default:
            return ""
        }
    }

    private func translateHumanToPet(pet: Pet) -> String {
        let petSound: String
        switch pet {
        case .dog:
            petSound = DogSounds.allSounds.randomElement() ?? DogSounds.bark
        case .cat:
            petSound = CatSounds.allSounds.randomElement() ?? CatSounds.meow
        }
        return petSound
    }

    private func translatePetToHuman() -> String {
          return PetMessage.allMessages.randomElement() ?? ""
      }
}
