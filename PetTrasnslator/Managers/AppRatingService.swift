//
//  AppRatingService.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import UIKit
import StoreKit

final class AppRatingService: AppRatingProtocol {
    func requestReview() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        SKStoreReviewController.requestReview(in: windowScene)
    }
}
