//
//  SettingsView.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 10/25/23.
//
// TODO: Make the audio play when the user makes a selection
import SwiftData
import SwiftUI

struct SettingsView: View {
    @State private var musicSelection = "successTrumpet.mp3"
    @Environment(\.dismiss) var dismiss
    @Environment(AudioManager.self) var audioManager
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
                Picker("Music Choice", selection: $musicSelection) {
                    ForEach(audioManager.audioChoices, id: \.self) { audioChoice in
                    Text("\(audioChoice)")
                    }
                }
                .padding(.horizontal, 10)
                .pickerStyle(.inline)
                Button("Save") {
                    audioManager.selectedAudio = saveChoice()
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
    }
    func saveChoice() -> String {
        let choice = musicSelection
        let url = audioManager.getDocumentsDirectory().appendingPathComponent("audioSelection.txt")
        do {
            try choice.write(to: url, atomically: true, encoding: .utf8)
            let input = try String(contentsOf: url)
            return input
        } catch {
            print(error.localizedDescription)
            return "Trumpet"
        }
    }
}
