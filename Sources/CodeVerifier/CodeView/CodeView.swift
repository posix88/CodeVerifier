//
//  CodeView.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 02/03/2020.
//
import SwiftUI

struct CodeView: View {
    
    var fields: [CodeLabelState]
    let style: SecureCodeStyle
    
    var body: some View {
        HStack(alignment: .bottom, spacing: style.labelSpacing) {
            ForEach(fields) { labelState in
                CodeLabel(labelState: labelState, style: style)
            }
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeView(fields: [.prompting, .empty, .empty, .empty, .empty], style: Styles.defaultStyle)
            CodeView(fields: [.prompting, .empty, .empty, .empty, .empty], style: Styles.defaultStyle)
                .environment(\.colorScheme, .dark)
        }
        
    }
}
