//
//  Carrier.swift
//  CodeVerifier
//
//  Created by MUSOLINO Antonino on 28/02/2020.
//
#if canImport(UIKit) && (os(iOS) || targetEnvironment(macCatalyst))
import SwiftUI

struct Carrier: View {
    @State private var blinking: Bool = false
    
    var height: CGFloat
    var color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: 1.5, height: height, alignment: .center)
            .foregroundColor(color)
            .opacity(blinking ? 0 : 1).animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
            .onAppear {
                self.blinking.toggle()
        }
    }
}

struct Carrier_Previews: PreviewProvider {
    static var previews: some View {
        Carrier(height: 25, color: .green)
    }
}
#endif
