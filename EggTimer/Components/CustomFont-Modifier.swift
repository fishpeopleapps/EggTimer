//
//  CustomFont-Modifier.swift
//  EggTimer
//
//  Created by Kimberly Brewer on 7/28/23.
//

import SwiftUI

extension Text {
    func eggText(_ size: CGFloat) -> some View {
        self.foregroundStyle(.black)
            .font(Font.custom("ReggaeOne-Regular", size: size))
    }
}
