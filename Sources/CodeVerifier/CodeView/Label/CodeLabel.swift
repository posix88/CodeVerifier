//
//  File.swift
//  
//
//  Created by MUSOLINO Antonino on 28/02/2020.
//

import SwiftUI

struct CodeLabel: View {
    
    @State var labelState: CodeLabelState
    
    // MARK: - Label dimension
    var lineWidth: CGFloat = 2
    
    var labelWidth: CGFloat = 20
    var labelHeight: CGFloat = 30
    
    // MARK: - Carrier
    var carrierHeight: CGFloat = 30
    
    // MARK: - Colors
    var carrierColor: Color = .black
    
    private var lineColor: Color {
        labelState.showingError ? errorLineColor : normalLineColor
    }
    
    private var textColor: Color {
        labelState.showingError ? errorTextColor : normalTextColor
    }
    
    var normalLineColor: Color = .black
    var errorLineColor: Color = .red
    
    var normalTextColor: Color = .black
    var errorTextColor: Color = .black
    
    public var body: some View {
        VStack(spacing: 5) {
            
            if !labelState.prompting {
                Text(labelState.textLabel).font(.body).fontWeight(.bold).foregroundColor(textColor).frame(width: labelWidth, height: labelHeight, alignment: .center)
            } else {
                Carrier(height: carrierHeight, color: carrierColor)
            }
            Rectangle().frame(width: labelWidth, height: lineWidth).foregroundColor(lineColor)
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
