    //
    //  SecureTextfield.swift
    //  CodeVerifier
    //
    //  Created by MUSOLINO Antonino on 03/03/2020.
    //

import SwiftUI
import UIKit

struct SecureTextfield: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var labels: Int
        
        init(text: Binding<String>, labels: Int) {
            _text = text
            self.labels = labels
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return true
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
        
        public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
        {
            guard let text = textField.text else {
                return true
            }
            
            guard string.isNumeric || string.count == 0 else { return false }
            
                // this is possible only if i've just pasted some text
            if string.count > 1 && string.count > labels {
                let index = string.index(string.startIndex, offsetBy: labels)
                textField.text = String(string.prefix(upTo: index))
                return false
            } else if string.count == 0 {
                if range.length > 1 {
                    textField.text = ""
                    return false
                } else if range.length == 1 {
                    let newString = textField.text?.dropLast()
                    textField.text = String(newString ?? "")
                    return false
                } else if range.length == 0 {
                    return true
                }
            }
            
            let newLength = text.count + string.count - range.length
            return newLength <= labels
        }
    }
    
    @Binding var text: String
    @Binding var isFocusable: Bool
    let labels: Int
    
    func makeUIView(context: UIViewRepresentableContext<SecureTextfield>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.textContentType = .oneTimeCode
        textField.tintColor = .clear
        textField.isSecureTextEntry = true
        return textField
    }
    
    func makeCoordinator() -> SecureTextfield.Coordinator {
        return Coordinator(text: $text, labels: labels)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<SecureTextfield>) {
        uiView.text = text
        if isFocusable {
            if !uiView.isFirstResponder {
                DispatchQueue.main.async {
                    uiView.becomeFirstResponder()
                }
            }
        } else {
            DispatchQueue.main.async {
                uiView.resignFirstResponder()
            }
        }
    }
    
}

struct SecureTextfield_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextfield(text: .constant(""), isFocusable: .constant(true), labels:  4).fixedSize(horizontal: false, vertical: true)
    }
}
