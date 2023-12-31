//
//  EggCookingView.swift
//  EggTimer
//
//  Created by KBrewer on 6/5/23.
//
// TODO: Move timeRemaining and totalTime to TimeManager
// TODO: Make an extension on file manager https://www.hackingwithswift.com/books/ios-swiftui/writing-data-to-the-documents-directory
// TODO: Well firstly if you go back and forth the progressView is not updating
// TODO: Make the progress view count down instead of count up, maybe that will fix the issue?
// https://developer.apple.com/documentation/swiftui/progressview
import SwiftData
import SwiftUI

/// View that holds a single egg, its associated time, and a countdown timer
struct EggCookingView: View {
    @Environment(AudioManager.self) var audioManager
    @State var timeRemaining: Int
    var timeManager = TimeManager()
    var choice: String
    var totalTime: Double
/// Holds the view
    var body: some View {
        ZStack {
            Color.backgroundGradient
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("The selected audio is \(audioManager.selectedAudio)") // this is resetting
                Image("\(choice)Egg")
                Text("Time Remaining: \(timeManager.formatTime(eggTime: timeRemaining))")
                    .eggText(20)
                ProgressView(value: timeManager.progress(totalTime))
                    .padding()
                    .foregroundColor(.black)
                    .tint(.black)
                Spacer()
            }
        }
        .onReceive(timeManager.timer) { _ in
            countDown()
        }
    }
    /// Counts down the time and plays the audio file once as the timer reaches 0
    func countDown() {
        if timeRemaining > 1 {
            timeRemaining -= 1
            timeManager.secondsPassed += 1
        } else if timeRemaining == 1 {
            completeCountDown()
        }
    }
    func completeCountDown() {
        audioManager.startPlayer(successSound: audioManager.selectedAudio)
        audioManager.player?.play()
        timeRemaining -= 1
        timeManager.secondsPassed = totalTime
    }
    func update(_ newTime: Date) {
        if timeRemaining > 0 {
            timeRemaining += 1
        } else {
            print("there's something happening here")
        }
    }
}
