//
//  ImageView.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

import SwiftUI

struct ImageView: View {
    private let image: String
    
    init(_ image: String) {
        self.image = image
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 184, height: 184)
            .background(Color.clear)
    }
}
