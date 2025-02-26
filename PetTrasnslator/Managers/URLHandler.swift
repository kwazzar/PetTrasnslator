//
//  URLHandler.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import UIKit

final class URLHandler: URLHandlerProtocol {
    func openURL(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}
