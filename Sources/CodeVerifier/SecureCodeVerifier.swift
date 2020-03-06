//
//  SecureCodeVerifier.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//

import SwiftUI

struct SecureCodeVerifier: View {

    @State private var secureCode: String = ""
    private var fields: [CodeLabelState] {
        computeFields()
    }
    var fieldNumber: Int = 6
    
    var body: some View {
        VStack{
            ZStack {
                CustomTextField(text: $secureCode, labels: fieldNumber, isFirstResponder: true)
                CodeView(fields: fields)
            }.padding()
            Text("\(secureCode.count) \(computeFields().count)")
        }
    }
    
    private func computeFields() -> [CodeLabelState] {
        // TODO: logic
        if secureCode.count == 2 {
            return [.empty, .empty]
        } else if secureCode.count > 2 {
            return [.filled(text: "2"), .filled(text: "3")]
        } else if secureCode.count == 1 {
            return [.empty]
        }
        return [.prompting]
    }
}

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier()
    }
}
