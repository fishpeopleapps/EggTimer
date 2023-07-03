//
//  EggImage.swift
//  EggTimer
//
//  Created by KBrewer on 5/30/23.
//
// Egg Images are from London App Brewery

import SwiftUI

/// Provides a dynamic egg image that can be used throughout the project
struct EggImage: View {
    var egg: String
    var body: some View {
        Image(egg)
            .resizable()
            .scaledToFit()
    }
}

struct EggImage_Previews: PreviewProvider {
    static var previews: some View {
        EggImage(egg: "softEgg")
    }
}
