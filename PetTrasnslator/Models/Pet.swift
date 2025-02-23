//
//  Pet.swift
//  PetTrasnslator
//
//  Created by Quasar on 22.02.2025.
//

import SwiftUI

enum Pet: CaseIterable {
    case cat
    case dog

    var color: Color {
        switch self {
        case .cat:
            return AppColors.catSelectColor
        case .dog:
            return AppColors.dogSelectColor
        }
    }

    var image: String {
        switch self {
        case .cat:
            return "catIcon"
        case .dog:
            return "dogIcon"
        }
    }
}
