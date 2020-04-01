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
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
