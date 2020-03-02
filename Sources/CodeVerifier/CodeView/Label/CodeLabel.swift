//
//  File.swift
//  
//
//  Created by MUSOLINO Antonino on 28/02/2020.
//

import SwiftUI

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

public struct CodeLabel: View {
    
    @State var labelState: CodeLabelState
    
    var lineWidth: CGFloat = 2
    
    var normalLineColor: Color = .black
    var errorLineColor: Color = .red
    
    var normalTextColor: Color = .black
    var errorTextColor: Color = .black
    
    var labelWidht: CGFloat = 20
    var labelHeight: CGFloat = 30
    
    private var carrierHeight: CGFloat {
        labelHeight - 5
    }
    
    var carrierColor: Color = .black
    
    private var lineColor: Color {
        labelState.showingError ? errorLineColor : normalLineColor
    }
    
    private var textColor: Color {
        labelState.showingError ? errorTextColor : normalTextColor
    }
    
    public var body: some View {
        VStack(spacing: 5) {
            
            if !labelState.prompting {
                Text(labelState.textLabel).font(.body).fontWeight(.bold).foregroundColor(textColor).frame(width: labelWidht, height: labelHeight, alignment: .center)
            } else {
                Carrier(height: carrierHeight, color: carrierColor)
            }
            Rectangle().frame(width: labelWidht, height: lineWidth).foregroundColor(lineColor)
        }
    }
}

struct CodeLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeLabel(labelState: .filled(text: "2"))
            CodeLabel(labelState: .prompting)
            CodeLabel(labelState: .error(text: "3"))
        }
    }
}
