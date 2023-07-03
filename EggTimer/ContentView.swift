//
//  ContentView.swift
//  EggTimer
//
//  Created by KBrewer on 5/30/23.
//
// TODO: Improve the UI and UX

import AVKit
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var audioManager: AudioManager
    /// Keys are the egg image names, Values are the egg timer times
    let eggs = ["softEgg": 5, "mediumEgg": 14, "hardEgg": 200]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Choose Egg Done Level")
                        .font(.title)
                    HStack {
                        // This is the formatting used to utilize both the KEY and VALUE in a for each loop
                        // When a button is pressed, it navigates to a new screen that displays the timer
                        // The egg image and timer amount are passed into the new vew
                        ForEach(eggs.sorted(by: >), id: \.key) { key, value in
                            NavigationLink {
                                EggCookingView(timeRemaining: value, choice: key, totalTime: Double(value))
                            } label: {
                                EggImage(egg: key)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
        // Changes the < Back to black so it is visible on the light background
        .tint(.black)
    }
}
