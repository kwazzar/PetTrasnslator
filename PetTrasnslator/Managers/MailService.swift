//
//  MailService.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import Foundation
import MessageUI

final class MailService: MailServiceProtocol {
    func canSendMail() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }

    func presentMailComposer(from viewController: UIViewController) {
        let mailComposer = MFMailComposeViewController()
        mailComposer.setToRecipients(["support@example.com"])
        mailComposer.setSubject("Feedback")
        viewController.present(mailComposer, animated: true)
    }
}
