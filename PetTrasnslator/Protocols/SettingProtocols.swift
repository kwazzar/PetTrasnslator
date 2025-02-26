//
//  SettingProtocols.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import UIKit

protocol MailServiceProtocol {
    func canSendMail() -> Bool
    func presentMailComposer(from viewController: UIViewController)
}

protocol URLHandlerProtocol {
    func openURL(_ urlString: String)
}

protocol AppRatingProtocol {
    func requestReview()
}

protocol PurchaseRestorerProtocol {
    func restorePurchases()
}
