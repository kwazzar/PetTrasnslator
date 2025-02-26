//
//  Language.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

enum Language {
       case human
       case pet

       var title: String {
           switch self {
           case .human:
               return "HUMAN"
           case .pet:
               return "PET"
           }
       }
   }

extension Language {
    mutating func toggle() {
        self = toggled()
    }

    func toggled() -> Language {
        self == .human ? .pet : .human
    }
}
