//
//  KeyboardAdaptive.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 01/04/2020.
//

import SwiftUI
import Combine

struct KeyboardAdaptive: ViewModifier {
    @State private var bottomPadding: CGFloat = 0
    
    func body(content: Content) -> some View {
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        let windowHeight = window?.bounds.height ?? 0
        return content
                .padding(.bottom, self.bottomPadding)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = windowHeight - keyboardHeight
                    let focusedInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    let textfieldHeight = UIResponder.currentFirstResponder?.globalFrame?.height ?? 0
                    self.bottomPadding = max(0, focusedInputBottom - keyboardTop + textfieldHeight)
                }.animation(.easeOut(duration: 0.16))
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}
