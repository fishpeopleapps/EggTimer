//
//  EggTimerApp.swift
//  EggTimer
//
//  Created by KBrewer on 5/30/23.
//

import SwiftUI

@main
struct EggTimerApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)

        }
    }
}
