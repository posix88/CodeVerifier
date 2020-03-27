//
//  CodeView.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 02/03/2020.
//
#if canImport(UIKit) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI

struct CodeView: View {
    
    var fields: [CodeLabelState]
    var spacing: CGFloat = 15
    
    var body: some View {
        HStack(alignment: .bottom, spacing: spacing) {
            ForEach(fields) { labelState in
                CodeLabel(labelState: labelState)
            }
        }
    }
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(fields: [.prompting, .empty, .empty, .empty, .empty])
    }
}
#endif
