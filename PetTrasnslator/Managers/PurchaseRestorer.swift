//
//  PurchaseRestorer.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import StoreKit

final class PurchaseRestorer: PurchaseRestorerProtocol {
    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}
