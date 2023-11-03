//
//  EggTimerApp.swift
//  EggTimer
//
//  Created by KBrewer on 5/30/23.
//
// TODO: Add a phone widget
import SwiftUI
import SwiftData

@main
struct EggTimerApp: App {
    @State private var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environment(audioManager)

        }
    }
}
