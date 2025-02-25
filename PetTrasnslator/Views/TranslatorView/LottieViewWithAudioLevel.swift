//
//  LottieViewWithAudioLevel.swift
//  PetTrasnslator
//
//  Created by Quasar on 25.02.2025.
//

import SwiftUI
import Lottie

struct LottieViewWithAudioLevel: UIViewRepresentable {
    private var animationName: String
    private var audioLevel: Float

    init(animationName: String, audioLevel: Float) {
        self.animationName = animationName
        self.audioLevel = audioLevel
    }

    private let totalFrames: CGFloat = 33
    private let lowValueFrame: CGFloat = 30

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(animationName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit

        animationView.currentFrame = lowValueFrame
        animationView.loopMode = .playOnce

        context.coordinator.animationView = animationView
        context.coordinator.totalFrames = totalFrames
        context.coordinator.lowValueFrame = lowValueFrame

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.updateAnimation(audioLevel: audioLevel)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator {
        var animationView: LottieAnimationView?
        var totalFrames: CGFloat = 33
        var lowValueFrame: CGFloat = 30

        func updateAnimation(audioLevel: Float) {
            guard let animationView = animationView else { return }
            // Визначаємо поріг гучності для активації анімації
            let voiceThreshold: Float = 0.1

            if audioLevel > voiceThreshold {
                // Є голос - мапуємо рівень гучності на кадри анімації
                // Використовуємо лінійну інтерполяцію від lowValueFrame до 0
                // рівень 0.1 -> кадр lowValueFrame, рівень 1.0 -> кадр 0
                let frame = lowValueFrame - (CGFloat(audioLevel) * lowValueFrame)

                // Обмежуємо значення кадру в межах від 0 до lowValueFrame
                let clampedFrame = max(0, min(lowValueFrame, frame))

                // Встановлюємо поточний кадр
                animationView.currentFrame = clampedFrame
            } else {
                // Немає голосу - використовуємо кадр спокою
                animationView.currentFrame = lowValueFrame
            }
        }
    }
}
