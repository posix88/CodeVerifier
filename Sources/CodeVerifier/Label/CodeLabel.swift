//
//  File.swift
//  
//
//  Created by MUSOLINO Antonino on 28/02/2020.
//

import SwiftUI

public struct CodeLabel: View {
    
    @State var error: Bool = false
    @State var content: String
    @State var showCarrier: Bool = false
    
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
        error ? errorLineColor : normalLineColor
    }
    
    private var textColor: Color {
        error ? errorTextColor : normalTextColor
    }
    
    public var body: some View {
        VStack(spacing: 5) {
            if !showCarrier {
                Text(content).font(.body).fontWeight(.bold).foregroundColor(textColor).frame(width: labelWidht, height: labelHeight, alignment: .center)
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
            CodeLabel(content: "2")
            CodeLabel(content: "", showCarrier: true)
            CodeLabel(error: true, content: "2")
        }
    }
}