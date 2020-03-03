//
//  SecureCodeVerifier.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//

import SwiftUI

struct SecureCodeVerifier: View {

    @State private var secureCode: String = ""
    
    var fieldNumber: Int = 6
    
    var body: some View {
        ZStack {
            CustomTextField(text: $secureCode, isFirstResponder: true)
            CodeView(fields: computeFields())
        }.padding()
    }
    
    private func computeFields() -> [CodeLabelState] {
        if secureCode.count > 2 {
            return [.empty, .empty]
        }
        return [.prompting]
    }
}

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier()
    }
}
