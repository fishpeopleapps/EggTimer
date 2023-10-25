//
//  BackgroundGradient.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 10/25/23.
//

import SwiftUI

extension Color {
    static let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [.orange, .yellow]),
        startPoint: .top,
        endPoint: .bottom)
}
