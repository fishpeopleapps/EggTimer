//
//  TimeManager.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 10/25/23.
//

import SwiftUI

@Observable class TimeManager {
    var secondsPassed = 0.0
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    /// Calculates the progress for the progressView
    /// - Returns: How much time has passed as the timer counts down
    func progress(_ total: Double) -> Float {
        Float(secondsPassed / total)
    }
    /// For display purposes, so user can see the countdown time in a normal time format
    /// - Parameter counter: The amount (in seconds) that will be formatted into a correct time display
    /// - Returns: 00:00 - correctly formatted time
    func formatTime(eggTime: Int) -> String {
        let minutes = Int(eggTime) / 60 % 60
        let seconds = Int(eggTime) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
