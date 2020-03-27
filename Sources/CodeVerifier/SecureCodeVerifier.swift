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
    @EnvironmentObject var style: SecureCodeStyle
    
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
        let width = (style.labelWidth * CGFloat(fieldNumber)) + style.labelSpacing
        return CGSize(width: width, height: height)
    }
    
    public init(code: String) {
        self.secureCode = code
    }
    
    public func onCodeFilled(perform action: ((Bool) -> Void)?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
    
    public var body: some View {
        VStack{
            ZStack {
                CustomTextField(text: $insertedCode, labels: fieldNumber, isFirstResponder: true).frame(width: textfieldSize.width, height: textfieldSize.height)
                Rectangle().frame(width: textfieldSize.width, height: textfieldSize.height).foregroundColor(.white)
                CodeView(fields: fields)
            }.padding()
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

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier(code: "123456").environmentObject(SecureCodeStyle())
    }
}
#endif
