//
//  SecureCodeVerifier.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//
#if canImport(UIKit) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI

public struct SecureCodeVerifier: View {
    
    @State private var insertedCode: String = ""
    @State private var style: SecureCodeStyle = Styles.defaultStyle
    @State private var isTextFieldFocused: Bool = false
    
    private let secureCode: String
    private var action: ((Bool) -> Void)?
    private var fields: [CodeLabelState] {
        computeFields()
    }
    
    var fieldNumber: Int {
        secureCode.count
    }
    
    private var textfieldSize: CGSize {
        let height = style.labelHeight + style.lineHeight + style.carrierSpacing
        let width = (style.labelWidth * CGFloat(fieldNumber)) + (style.labelSpacing * CGFloat(fieldNumber - 1))
        return CGSize(width: width, height: height)
    }
    
    public init(code: String) {
        self.secureCode = code
    }
    
    public var body: some View {
        VStack{
            ZStack {
                CustomTextField(text: $insertedCode, isFocusable: $isTextFieldFocused, labels: fieldNumber).frame(width: textfieldSize.width, height: textfieldSize.height)
                Rectangle().frame(width: textfieldSize.width, height: textfieldSize.height).foregroundColor(.white).onTapGesture {
                    self.isTextFieldFocused.toggle()
                }
                CodeView(fields: fields, style: self.style)
            }.padding().keyboardAdaptive()
        }
    }
    
    private func computeFields() -> [CodeLabelState] {
        guard !insertedCode.isEmpty else {
            let empty: [CodeLabelState] = Array(repeating: .empty, count: fieldNumber - 1)
            return [.prompting] + empty
        }
        let remainingLabel = fieldNumber - insertedCode.count
        let filledField = insertedCode.map { CodeLabelState.filled(text: "\($0)") }
        
        guard remainingLabel > 0 else {
            let isCorrect = secureCode == insertedCode
            action?(isCorrect)
            return isCorrect ? filledField : insertedCode.map { CodeLabelState.error(text: "\($0)") }
        }
        return filledField + [.prompting] + Array(repeating: .empty, count: remainingLabel - 1)
    }
}

extension SecureCodeVerifier {
    public func onCodeFilled(perform action: ((Bool) -> Void)?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
    
    public func withStyle(_ style: SecureCodeStyle) -> Self {
        let copy = self
        copy.style = style
        return copy
    }
}

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier(code: "123456")
    }
}
#endif
