//
//  MicrophoneButtonView.swift
//  PetTrasnslator
//
//  Created by Quasar on 25.02.2025.
//

import SwiftUI

struct MicrophoneButtonView: View {
    var action: () -> Void
    @ObservedObject var audioManager: AudioRecorderManager
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack(spacing: 20) {
                if audioManager.isRecording {
                    LottieViewWithAudioLevel(
                        animationName: "microphoneRecording",
                        audioLevel: audioManager.audioLevel)
                    .frame(width: 160, height: 70)
                    .padding(.top, 20)
                    Text("Recording...")
                        .font(.konkhmerSleokchher(size: 16))
                        .foregroundColor(.black)
                        .padding(.bottom, -15)
                } else {
                    Image("microphoneIcon")
                        .frame(width: 70, height: 70)
                        .padding(.top, 20)
                    Text("Start Speak")
                        .font(.konkhmerSleokchher(size: 16))
                        .foregroundColor(.black)
                        .padding(.bottom, -15)
                }
            }
            .frame(width: 178, height: 176)
            .background(AppColors.objectColor)
            .cornerRadius(16)
        }
        .alert("Microphone Access Denied", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
            Button("Settings") {
                if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsURL)
                }
            }
        } message: {
            Text("Please allow microphone access in Settings.")
        }
        .buttonStyle(BounceButtonStyle())
    }
}


struct MicrophoneButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MicrophoneButtonView(action: {}, audioManager: AudioRecorderManager(), showAlert: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.green)
    }
}
