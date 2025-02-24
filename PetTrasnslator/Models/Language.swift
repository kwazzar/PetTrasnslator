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

       mutating func toggle() {
           self = (self == .human) ? .pet : .human
       }
   }
