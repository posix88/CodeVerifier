//
//  SecureCodeVerifier.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//

import SwiftUI
import Combine

class SecureCodeStatus: ObservableObject  {
    @Published var secureCode: String = ""
}

public struct SecureCodeVerifier: View {

    @State private var secureCode: String = ""
    
    private var action: ((String) -> Void)?
    
    private var fields: [CodeLabelState] {
        computeFields()
    }
    
    var fieldNumber: Int = 6
    
    public init(fields: Int = 6) {
        fieldNumber = fields
    }
    
    public func onCodeFilled(perform action: ((String) -> Void)?) -> Self {
      var copy = self
      copy.action = action
      return copy
    }
    
    public var body: some View {
        VStack{
            ZStack {
                CustomTextField(text: $secureCode, labels: fieldNumber, isFirstResponder: true)
                Rectangle().foregroundColor(.white)
                CodeView(fields: fields)
            }.padding()
        }
    }
    
    private func computeFields() -> [CodeLabelState] {
        guard !secureCode.isEmpty else {
            let empty: [CodeLabelState] = Array(repeating: .empty, count: fieldNumber - 1)
            return [.prompting] + empty
        }
        let remainingLabel = fieldNumber - secureCode.count
        let filledField = secureCode.map { CodeLabelState.filled(text: "\($0)") }
        
        guard remainingLabel > 0 else {
            action?(secureCode)
            return filledField
        }
        return filledField + [.prompting] + Array(repeating: .empty, count: remainingLabel - 1)
    }
}
