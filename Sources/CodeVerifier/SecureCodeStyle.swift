//
//  SecureCodeData.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 27/03/2020.
//
#if canImport(UIKit) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI
import Combine

public class SecureCodeStyle: ObservableObject {

    // MARK: - Bottom Line dimension
    var lineWidth: CGFloat = 20
    var lineHeight: CGFloat = 2
    
    // MARK: - Code Label dimension
    var labelWidth: CGFloat = 20
    var labelHeight: CGFloat = 30
    var labelSpacing: CGFloat = 15
    
    // MARK: - Carrier
    var carrierHeight: CGFloat = 30
    var carrierSpacing: CGFloat = 5
    
    // MARK: - Colors
    var carrierColor: Color = .black
    
    public init(lineWidth: CGFloat = 20, lineHeight: CGFloat = 2, labelWidth: CGFloat = 20, labelHeight: CGFloat = 30, labelSpacing: CGFloat = 15, carrierHeight: CGFloat = 30, carrierSpacing: CGFloat = 5, carrierColor: Color = .black) {
        self.lineWidth = lineWidth
        self.lineHeight = lineHeight
        self.labelWidth = labelWidth
        self.labelHeight = labelHeight
        self.labelSpacing = labelSpacing
        self.carrierColor = carrierColor
        self.carrierHeight = carrierHeight
        self.carrierSpacing = carrierSpacing
    }
}
#endif
