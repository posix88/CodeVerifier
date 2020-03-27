//
//  File.swift
//  
//
//  Created by MUSOLINO Antonino on 28/02/2020.
//
#if canImport(UIKit) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI

struct CodeLabel: View {
    
    @State var labelState: CodeLabelState
    @EnvironmentObject var style: SecureCodeStyle
    
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
        VStack(spacing: style.carrierSpacing) {
            
            if !labelState.prompting {
                Text(labelState.textLabel).font(.body).fontWeight(.bold).foregroundColor(textColor).frame(width: style.labelWidth, height: style.labelHeight, alignment: .center)
            } else {
                Carrier(height: style.carrierHeight, color: style.carrierColor)
            }
            Rectangle().frame(width: style.lineWidth, height: style.lineHeight).foregroundColor(lineColor)
        }
    }
}

struct CodeLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeLabel(labelState: .filled(text: "2"))
            CodeLabel(labelState: .prompting)
            CodeLabel(labelState: .error(text: "3"))
        }.environmentObject(SecureCodeStyle())
    }
}
#endif
