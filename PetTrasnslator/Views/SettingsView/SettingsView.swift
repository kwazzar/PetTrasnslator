//
//  SettingsView.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel

    var body: some View {
        BackgroundView {
            GeometryReader { geometry in
                VStack {
                    HeaderView(title: "Settings")
                        .frame(height: geometry.size.height * 0.15)
                        .padding(.top, geometry.size.height * 0.001)
                        .frame(maxWidth: .infinity, alignment: .top)

                    ForEach(Settings.allCases, id: \.self) { button in
                        SettingsButton(action: {
                            viewModel.handleSettingsAction(for: button)
                        }, title: button.title)
                    }
                    Spacer()
                }
            }
        }
        .alert("Message", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(mailService: MailService(), urlHandler: URLHandler(), appRatingService: AppRatingService(), purchaseRestorer: PurchaseRestorer()))
    }
}
