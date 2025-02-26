//
//  Settings.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import Foundation
import UIKit

enum Settings: CaseIterable {
    case rateUs
    case shareApp
    case contactUs
    case restorePurchases
    case privacyPolicy
    case termsOfUse

    var title: String {
        switch self {
        case .rateUs:
            return "Rate Us"
        case .shareApp:
            return "Share App"
        case .contactUs:
            return "Contact Us"
        case .restorePurchases:
            return "Restore Purchases"
        case .privacyPolicy:
            return "Privacy Policy"
        case .termsOfUse:
            return "Terms of Use"
        }
    }

    func performAction() {
        switch self {
        case .rateUs:
            // Trigger the rate us functionality in SwiftUI
            print("Opening Rate Us")
        case .shareApp:
            // Code to show share sheet
            print("Opening share sheet")
        case .contactUs:
            // Code to open email or contact form
            print("Opening contact form")
        case .restorePurchases:
            // Code to trigger in-app purchase restoration
            print("Restoring purchases")
        case .privacyPolicy:
            // Code to open privacy policy page
            print("Opening privacy policy")
        case .termsOfUse:
            // Code to open terms of use page
            print("Opening terms of use")
        }
    }
}
