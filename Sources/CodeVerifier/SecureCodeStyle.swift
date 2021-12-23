//
//  SecureCodeData.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 27/03/2020.
//

import SwiftUI

public struct Styles {
    
    public static let defaultStyle = SecureCodeStyle(lineWidth: 20, lineHeight: 2, normalLineColor: .black, errorLineColor: .red, labelWidth: 20, labelHeight: 30, labelSpacing: 15, normalTextColor: .black, errorTextColor: .black, carrierHeight: 30, carrierSpacing: 5, carrierColor: .black)
}

public class SecureCodeStyle {

    // MARK: - Bottom Line dimension
    var lineWidth: CGFloat
    var lineHeight: CGFloat
    var normalLineColor: Color
    var errorLineColor: Color
    
    // MARK: - Code Label dimension
    var labelWidth: CGFloat
    var labelHeight: CGFloat
    var labelSpacing: CGFloat
    var normalTextColor: Color
    var errorTextColor: Color
    
    // MARK: - Carrier
    var carrierHeight: CGFloat
    var carrierSpacing: CGFloat
    var carrierColor: Color
    
    public init(lineWidth: CGFloat, lineHeight: CGFloat, normalLineColor: Color, errorLineColor: Color, labelWidth: CGFloat, labelHeight: CGFloat, labelSpacing: CGFloat, normalTextColor: Color, errorTextColor: Color, carrierHeight: CGFloat, carrierSpacing: CGFloat, carrierColor: Color) {
        self.lineWidth = lineWidth
        self.lineHeight = lineHeight
        self.normalLineColor = normalLineColor
        self.errorLineColor = errorLineColor
        self.labelWidth = labelWidth
        self.labelHeight = labelHeight
        self.labelSpacing = labelSpacing
        self.normalTextColor = normalTextColor
        self.errorTextColor = errorTextColor
        self.carrierColor = carrierColor
        self.carrierHeight = carrierHeight
        self.carrierSpacing = carrierSpacing
    }
}

