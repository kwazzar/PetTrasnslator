//
//  ResponseCloudView.swift
//  PetTrasnslator
//
//  Created by Quasar on 26.02.2025.
//

import SwiftUI

struct ResponseCloudView: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.konkhmerSleokchher(size: 12))
                .padding(5)
        }
        .frame(width: 291, height: 142)
        .background(AppColors.responseCloudColor)
        .cornerRadius(16)
    }
}

struct ResponseCloud_Previews: PreviewProvider {
    static var previews: some View {
        ResponseCloudView(text: "Sample response text")
    }
}
