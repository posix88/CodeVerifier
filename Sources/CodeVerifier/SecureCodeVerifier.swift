    //
    //  SecureCodeVerifier.swift
    //  CodeVerifier
    //
    //  Created by MUSOLINO Antonino on 03/03/2020.
    //
#if canImport(SwiftUI) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI

public struct SecureCodeVerifier: View {
    
    @State private var insertedCode: String = ""
    @State private var isTextFieldFocused: Bool = false
    
    /// The secure code to validate
    private let secureCode: String
    
    /// The number of fields
    private let fieldNumber: Int
    
    /// The size of the SecureCodeVerifier
    private let textfieldSize: CGSize
    
    /// The style applied to SecureCodeVerifier
    private var style: SecureCodeStyle
    
    private var action: ((Bool) -> Void)?
    
    private var fields: [CodeLabelState] {
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
    
    public init(code: String, style: SecureCodeStyle = Styles.defaultStyle) {
        self.secureCode = code
        self.style = style
        self.fieldNumber = code.count
        let height = style.labelHeight + style.lineHeight + style.carrierSpacing
        let width = (style.labelWidth * CGFloat(fieldNumber)) + (style.labelSpacing * CGFloat(fieldNumber - 1))
        self.textfieldSize = CGSize(width: width, height: height)
    }

    public var body: some View {
        ZStack {
            CustomTextField(text: $insertedCode, isFocusable: $isTextFieldFocused, labels: fieldNumber)
            
            Rectangle()
                .foregroundColor(.white)
                .onTapGesture {
                    isTextFieldFocused.toggle()
                }
            
            CodeView(fields: fields, style: style)
        }
        .frame(width: textfieldSize.width, height: textfieldSize.height)
        .padding()
    }
}

extension SecureCodeVerifier {
    public func onCodeFilled(perform action: ((Bool) -> Void)?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
    
    @available(*, deprecated, message: "Use the SecureCodeVerifier init")
    public func withStyle(_ style: SecureCodeStyle) -> Self {
        var copy = self
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
