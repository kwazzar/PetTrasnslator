//
//  RootView.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct RootView: View {
    @State private var selectedMenu: MenuButtons = .translator
    private let container: ContainerProtocol

    init(container: ContainerProtocol) {
        self.container = container
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedMenu) {
                TranslatorView(viewModel: container.createTranslatorViewModel(), container: container)
                    .tag(MenuButtons.translator)
                    .ignoresSafeArea(.keyboard, edges: .bottom)

                SettingsView(viewModel: container.createSettingsViewModel())
                    .tag(MenuButtons.setting)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            }

            GeneralMenu(selectedMenu: $selectedMenu)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(container: AppContainer())
    }
}
