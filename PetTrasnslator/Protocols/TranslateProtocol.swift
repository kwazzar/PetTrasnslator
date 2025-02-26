//
//  TranslateProtocol.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

protocol TranslateProtocol {
    func translate(from source: Language, to destination: Language, pet: Pet) -> String
}
