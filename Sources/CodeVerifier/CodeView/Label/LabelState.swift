//
//  LabelState.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 03/03/2020.
//

import Foundation

enum CodeLabelState: Identifiable {
    var id: UUID {
        UUID()
    }
    
    case error(text: String)
    case filled(text: String)
    case empty
    case prompting
    
    var textLabel: String {
        switch self {
        case .filled(text: let text), .error(text: let text):
            return text
        default:
            return ""
        }
    }
    
    var showingError: Bool {
        switch self {
        case .error:
            return true
        default:
            return false
        }
    }
    
    var prompting: Bool {
        switch self {
        case .prompting:
            return true
        default:
            return false
        }
    }
}
