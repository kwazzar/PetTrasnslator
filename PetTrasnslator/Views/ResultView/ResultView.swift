//
//  ResultView.swift
//  PetTrasnslator
//
//  Created by Quasar on 23.02.2025.
//

import SwiftUI

struct ResultView: View {
    @StateObject var viewModel: ResultViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        BackgroundView {
            GeometryReader { geometry in
                ZStack {
                    if viewModel.hasTranslation {
                        lineToResponseCloud(geometry: geometry)
                    }
                    
                    VStack(spacing: 0) {
                        HeaderView(title: "Result")
                            .frame(height: geometry.size.height * 0.15)
                            .padding(.top, geometry.size.height * 0.001)
                            .overlay(alignment: .leading) {
                                CloseButton{ dismiss() }
                                    .padding(.leading, 15)
                            }
                        
                        Spacer(minLength: geometry.size.height * 0.02)
                        
                        if viewModel.hasTranslation {
                            ResponseCloudView(text: viewModel.translationText)
                                .padding(.bottom, geometry.size.height * 0.1)
                        } else {
                            RepeatButton { dismiss() }
                                .frame(width: geometry.size.width * 0.8,
                                       height: geometry.size.height * 0.2)
                                .padding(.bottom, geometry.size.height * 0.1)
                        }
                        
                        ImageView(viewModel.selectedPet.image)
                            .frame(height: geometry.size.height * 0.3)
                            .padding(.bottom, geometry.size.height * -0.1)
                        Spacer()
                    }
                }
            }
        }
    }
}

private extension ResultView {
    //MARK: - lineToResponseCloud
    func lineToResponseCloud(geometry: GeometryProxy) -> some View {
        let startX = geometry.size.width * 0.11
        let startY = geometry.size.height * 0.65
        let lineLength: CGFloat = 155
        let angle: CGFloat = atan2(geometry.size.height * 0.35 - startY, geometry.size.width * 0.4 - startX)
        let endX = startX + lineLength * cos(angle)
        let endY = startY + lineLength * sin(angle)
        
        return TaperedLine(startX: startX, startY: startY, endX: endX, endY: endY)
            .fill(AppColors.responseCloudColor)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .offset(x: geometry.size.width * 0.56, y: geometry.size.height * -0.01)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(viewModel: ResultViewModel())
    }
}
