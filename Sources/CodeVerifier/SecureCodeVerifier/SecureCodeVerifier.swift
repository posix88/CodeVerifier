    //
    //  SecureCodeVerifier.swift
    //  CodeVerifier
    //
    //  Created by MUSOLINO Antonino on 03/03/2020.
    //

import SwiftUI

public struct SecureCodeVerifier: View {
    
        /// The style applied to SecureCodeVerifier
    @Environment(\.secureCodeStyle) var style: SecureCodeStyle
    
    @State private var insertedCode: String = ""
    @State private var isTextFieldFocused: Bool = false
    
    @StateObject private var viewModel: SecureCodeVerifierViewModel
    
        /// The size of the SecureCodeVerifier
    private var textfieldSize: CGSize = .zero
    
    private var action: ((Bool) -> Void)?
    
    public init(code: String) {
        self._viewModel = StateObject(wrappedValue: SecureCodeVerifierViewModel(code: code))
        let height = style.labelHeight + style.lineHeight + style.carrierSpacing
        let width = (style.labelWidth * CGFloat(code.count)) + (style.labelSpacing * CGFloat(code.count - 1))
        self.textfieldSize = CGSize(width: width, height: height)
    }
    
    public var body: some View {
        CodeView(fields: viewModel.fields)
            .background(
                Rectangle()
                    .foregroundColor(.white)
            )
            .background(
                SecureTextfield(text: $insertedCode, isFocusable: $isTextFieldFocused, labels: viewModel.fieldNumber)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                isTextFieldFocused.toggle()
            }
            .frame(width: textfieldSize.width, height: textfieldSize.height)
            .padding()
            .onChange(of: insertedCode) { newValue in
                viewModel.buildFields(for: newValue)
            }
            .onReceive(viewModel.$codeCorrect.dropFirst()) { value in
                action?(value)
            }
    }
}

extension SecureCodeVerifier {
    public func onCodeFilled(perform action: ((Bool) -> Void)?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
    
    @available(*, deprecated, message: "Use the environment injection instead. This modifier does nothing.")
    public func withStyle(_ style: SecureCodeStyle) -> Self {
        return self
    }
}

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier(code: "123456")
    }
}
