//
//  CodeView.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 02/03/2020.
//
import SwiftUI

/// Represents the list of all secure code fields
struct CodeView: View {
    @Environment(\.secureCodeStyle) var style: SecureCodeStyle
    
    var fields: [CodeLabelState]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: style.labelSpacing) {
            ForEach(fields) { labelState in
                CodeLabel(state: labelState)
            }
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeView(fields: [.prompting, .empty, .empty, .empty, .empty])
            CodeView(fields: [.prompting, .empty, .empty, .empty, .empty])
                .environment(\.colorScheme, .dark)
        }
    }
}
