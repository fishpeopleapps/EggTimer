//
//  AudioManager.swift
//  EggTimer
//
//  Created by KBrewer on 6/3/23.
//
// The audio file was found online from an free commercial music source

// TODO: Save user choice into documents directory so it persists

import AVKit
import SwiftUI

/// An environment singleton responsible for loading an audio file and preparing it for playback
@Observable
class AudioManager {
    let audioChoices = ["Trumpet", "Corporate", "Jingle"]
    var selectedAudio = "Trumpet"



    
    var player: AVAudioPlayer?
    /// Loads the audio file passed in, if successful initializes the audio player for playback
    /// - Parameter successSound: Success audio that plays when the timer is complete
    func startPlayer(successSound: String) {
        guard let url = Bundle.main.url(forResource: successSound, withExtension: "mp3") else {
            print("Resource not found")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Failed to initialize player", error)
        }
    }
}
