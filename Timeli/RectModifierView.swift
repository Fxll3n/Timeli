//
//  RectModifierView.swift
//  Timeli
//
//  Created by Angel Bitsov on 4/30/24.
//

import SwiftUI

struct RectModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.gray)
            
    }
}
