//
//  SecureCodeVerifierViewModel.swift
//  
//
//  Created by MUSOLINO Antonino on 26/12/21.
//

import Foundation

class SecureCodeVerifierViewModel: ObservableObject {
    
    @Published var fields: [CodeLabelState] = []
    @Published var codeCorrect: Bool = false
    
        /// The secure code to validate
    private let secureCode: String
    
        /// The number of fields
    let fieldNumber: Int
    
    init(code: String) {
        self.secureCode = code
        self.fieldNumber = code.count
        fields = [.prompting] + Array(repeating: .empty, count: code.count - 1)
    }
    
    func buildFields(for code: String) {
        guard !code.isEmpty else {
            let empty: [CodeLabelState] = Array(repeating: .empty, count: fieldNumber - 1)
            fields = [.prompting] + empty
            return
        }
        let remainingLabel = fieldNumber - code.count
        let filledField = code.map { CodeLabelState.filled(text: "\($0)") }
        
        guard remainingLabel > 0 else {
            codeCorrect = secureCode == code
            fields = codeCorrect ? filledField : code.map { CodeLabelState.error(text: "\($0)") }
            return
        }
        fields = filledField + [.prompting] + Array(repeating: .empty, count: remainingLabel - 1)
    }
    
}
