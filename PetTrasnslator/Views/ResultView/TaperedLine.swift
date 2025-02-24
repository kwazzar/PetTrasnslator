//
//  TaperedLine.swift
//  PetTrasnslator
//
//  Created by Quasar on 24.02.2025.
//

import SwiftUI

struct TaperedLine: Shape {
    let startX: CGFloat
    let startY: CGFloat
    let endX: CGFloat
    let endY: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let topWidth: CGFloat = 0.5
        let bottomWidth: CGFloat = 12

        path.move(to: CGPoint(x: startX - topWidth, y: startY))
        path.addLine(to: CGPoint(x: startX + topWidth, y: startY))

        path.addLine(to: CGPoint(x: endX + bottomWidth, y: endY))
        path.addLine(to: CGPoint(x: endX - bottomWidth, y: endY))

        path.closeSubpath()

        return path
    }
}
