//
//  EggCookingView.swift
//  EggTimer
//
//  Created by KBrewer on 6/5/23.
//

import SwiftUI

/// View that holds a single egg, its associated time, and a countdown timer
struct EggCookingView: View {
    @EnvironmentObject var audioManager: AudioManager
    @State var timeRemaining: Int
    @State private var secondsPassed = 0.0
    var choice: String
    var totalTime: Double
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image(choice)
                Text(formatTime(eggTime: timeRemaining))
                    .font(.title2)
                ProgressView(value: progress())
                    .padding()
                    .foregroundColor(.black)
                    .tint(.black)
                Spacer()
            }
        }
        .onReceive(timer) { _ in
            countDown()
        }
    }
    /// For display purposes, so user can see the countdown time in a normal time format
    /// - Parameter counter: The amount (in seconds) that will be formatted into a correct time display
    /// - Returns: 00:00 - correctly formatted time
    func formatTime(eggTime: Int) -> String {
        let minutes = Int(eggTime) / 60 % 60
        let seconds = Int(eggTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    /// Counts down the time and plays the audio file once as the timer reaches 0
    func countDown() {
        if timeRemaining > 1 {
            timeRemaining -= 1
            secondsPassed += 1
            print(timeRemaining)
        } else if timeRemaining == 1 {
            audioManager.startPlayer(successSound: "successTrumpet")
            audioManager.player?.play()
            timeRemaining -= 1
            secondsPassed = totalTime
        }
    }
    /// Calculates the progress for the progressView
    /// - Returns: How much time has passed as the timer counts down
    func progress() -> Float {
        Float(secondsPassed / totalTime)
    }
}
