//
//  SplashView.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 7/28/23.
//
// TODO: Can you add a hopping egg animation? It should start on the right, then bounce its way
// off screen to the left

import SwiftUI

struct SplashView: View {
    @State var showingContentView = false
    var body: some View {
        ZStack {
            if showingContentView {
                ContentView()
            } else {
                Color.backgroundGradient
                    .ignoresSafeArea()
                Text("EggTimer")
                    .eggText(38)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showingContentView = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
