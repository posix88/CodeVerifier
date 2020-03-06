//
//  SecureTextfield.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//

import SwiftUI
import UIKit

struct CustomTextField: UIViewRepresentable {

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        var labels: Int
        var didBecomeFirstResponder = false

        init(text: Binding<String>, labels: Int) {
            _text = text
            self.labels = labels
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return false
        }

        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
        {
            guard let text = textField.text else {
                return true
            }

            // this is possible only if i've just pasted some text
            if string.count > 1 {
                self.text = "wow"
                return true
            }
            
            let newLength = text.count + string.count - range.length

            // I'm adding characters into the textfield
            if newLength <= labels && string.count > 0 {
               // APPEND
            }
            // I'm deleting characters from the textfield
            else if string.count == 0 {
                if range.length > 1 {
                    self.text = ""
                } else if range.length == 1 {
                    // REMOVE SINGLE
                } else if range.length == 0 {
                    return true
                }
            }

            return newLength <= labels
        }
    }

    @Binding var text: String
    let labels: Int
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, labels: labels)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
