//
//  StringExtensions.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 20/03/2020.
//

import Foundation
extension String {
    var isNumeric: Bool {
        guard !self.isEmpty else { return false }
        return CharacterSet(charactersIn: self).isSubset(of: CharacterSet.decimalDigits)
    }
}
