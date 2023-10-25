//
//  ContentView.swift
//  EggTimer
//
//  Created by KBrewer on 5/30/23.
//
// TODO: Error: ProgressView initialized with an out-of-bounds progress value. The value will be clamped to the range of `0...total`.
import AVKit
import SwiftUI

struct ContentView: View {
    @Environment(AudioManager.self) var audioManager
    /// Keys are the egg image names, Values are the egg timer times
    let eggs = ["soft": 5, "medium": 14, "hard": 200]
    @State private var isShowingSettings = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundGradient
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("How would you like your eggs cooked?")
                        .eggText(30)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    HStack {
                        /// This is the formatting used to utilize both the KEY and VALUE in a for each loop
                        /// When a button is pressed, it navigates to a new screen that displays the timer
                        /// The egg image and timer amount are passed into the new view
                        ForEach(eggs.sorted(by: >), id: \.key) { key, value in
                            NavigationLink {
                                EggCookingView(timeRemaining: value, choice: key, totalTime: Double(value))
                            } label: {
                                EggView(egg: "\(key)Egg", imageLabel: key.capitalized)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView(audioManager: AudioManager())
                    .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSettings.toggle()
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
        }
        // Changes the < Back to black so it is visible on the light background
        .tint(.black)
    }
}
