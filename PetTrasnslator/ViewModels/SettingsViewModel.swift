//
//  SettingsViewModel.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @Published var showMailSheet = false
    @Published var showAlert = false
    @Published var alertMessage = ""

    private let mailService: MailServiceProtocol
    private let urlHandler: URLHandlerProtocol
    private let appRatingService: AppRatingProtocol
    private let purchaseRestorer: PurchaseRestorerProtocol

    init(
        mailService: MailServiceProtocol,
        urlHandler: URLHandlerProtocol,
        appRatingService: AppRatingProtocol,
        purchaseRestorer: PurchaseRestorerProtocol
    ) {
        self.mailService = mailService
        self.urlHandler = urlHandler
        self.appRatingService = appRatingService
        self.purchaseRestorer = purchaseRestorer
    }

    @MainActor
    func handleSettingsAction(for setting: Settings) {
        switch setting {
        case .rateUs:
            rateApp()
        case .shareApp:
            shareApp()
        case .contactUs:
            handleContactUs()
        case .restorePurchases:
            restorePurchases()
        case .privacyPolicy:
            openURL(Constant.privacyPolicyURL)
        case .termsOfUse:
            openURL(Constant.termsOfUseURL)
        }
    }
}

//MARK: - private methods
@MainActor
extension SettingsViewModel {
    private func rateApp() {
        appRatingService.requestReview()
    }

    private func shareApp() {
        guard let url = URL(string: Constant.appStoreURL) else { return }
        let activityVC = UIActivityViewController(activityItems: ["Try this cool app!", url], applicationActivities: nil)
        rootViewController?.present(activityVC, animated: true)
    }

    private func handleContactUs() {
        if mailService.canSendMail() {
            showMailSheet = true
        } else {
            alertMessage = "Please configure your email client"
            showAlert = true
        }
    }

    private func restorePurchases() {
        purchaseRestorer.restorePurchases()
        alertMessage = "Purchases restored"
        showAlert = true
    }

    private func openURL(_ urlString: String) {
        urlHandler.openURL(urlString)
    }

    private var rootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?
            .rootViewController
    }
}
