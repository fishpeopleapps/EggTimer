//
//  EggView.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 7/28/23.
//

import SwiftUI
/// Provides a dynamic egg image with a label underneath
struct EggView: View {
    var egg: String
    var imageLabel: String
    var body: some View {
        VStack {
            Image(egg)
                .resizable()
                .scaledToFit()
            Text(imageLabel) // Capitalizes the first letter of the string
                .eggText(20)
        }
    }
}

struct EggView_Previews: PreviewProvider {
    static var previews: some View {
        EggView(egg: "softEgg", imageLabel: "Egg")
    }
}
