//
//  HeaderView.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

import SwiftUI

struct HeaderView: View {
    private let title: String

    init(title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.konkhmerSleokchher(size: 37))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.clear)
            .frame(height: 58)
    }
}
