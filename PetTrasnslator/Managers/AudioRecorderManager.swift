//
//  AudioRecorderManager.swift
//  PetTrasnslator
//
//  Created by Quasar on 25.02.2025.
//

import AVFoundation
import SwiftUI

final class AudioRecorderManager: ObservableObject {
    @Published var isRecording = false
    @Published var audioLevel: Float = 0.0
    private var audioRecorder: AVAudioRecorder?
    private var timer: Timer?

    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord, mode: .default, options: .defaultToSpeaker)
        try? audioSession.setActive(true)

        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]

        let documentsPath = FileManager.default.temporaryDirectory
        let audioFilename = documentsPath.appendingPathComponent("recording.m4a")

        audioRecorder = try? AVAudioRecorder(url: audioFilename, settings: settings)
        audioRecorder?.isMeteringEnabled = true
        audioRecorder?.record()

        isRecording = true

        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.audioRecorder?.updateMeters()
            let level = self.audioRecorder?.averagePower(forChannel: 0) ?? -160

            let normalizedLevel = max(0, 1.0 + Float(level) / 50.0)

            DispatchQueue.main.async {
                self.audioLevel = normalizedLevel
            }
        }
    }

    func stopRecording() {
        timer?.invalidate()
        timer = nil
        audioRecorder?.stop()
        audioRecorder = nil
        isRecording = false
        audioLevel = 0.0 
    }

    func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
}
