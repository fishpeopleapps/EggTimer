//
//  SettingsView.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 10/25/23.
//
// TODO: Make the audio play when the user makes a selection

import SwiftUI

struct SettingsView: View {
    @State private var musicSelection = "successTrumpet.mp3"
    @Environment(\.dismiss) var dismiss
    @Bindable var audioManager: AudioManager
    var body: some View {
        ZStack {
            Color(.settingsPurple)
                .ignoresSafeArea()
            VStack {
                Text("Change the Music")
                    .eggText(20)
                    .padding(.horizontal, 25)
                    .background(Color.white).opacity(0.8)
                    .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                Text("The selected audio is \(audioManager.selectedAudio)")
                Picker("Music Choice", selection: $audioManager.selectedAudio) {
                    ForEach(audioManager.audioChoices, id: \.self) { audioChoice in
                    Text("\(audioChoice)")
                    }
                }
                .padding(.horizontal, 10)
                .pickerStyle(.inline)
                Button("Save") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
    }
}
