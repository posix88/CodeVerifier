import SwiftUI

/// The smallest view in the verifier.
/// Contains the text label and the blinking carrier when needed
struct CodeLabel: View {
    @Environment(\.secureCodeStyle) var style: SecureCodeStyle
    
    let labelState: CodeLabelState
    
    private var lineColor: Color = .clear
    private var textColor: Color = .clear
    
    init(state: CodeLabelState) {
        self.labelState = state
        self.lineColor = state.showingError ? style.errorLineColor : style.normalLineColor
        self.textColor = state.showingError ? style.errorTextColor : style.normalTextColor
    }
    
    public var body: some View {
        VStack(spacing: style.carrierSpacing) {
            Text(labelState.textLabel)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .frame(width: style.labelWidth, height: style.labelHeight, alignment: .center)
                .overlay(carrier)
            Rectangle()
                .frame(width: style.lineWidth, height: style.lineHeight)
                .foregroundColor(lineColor)
        }
    }
    
    @ViewBuilder var carrier: some View {
        if labelState.prompting {
            Carrier(height: style.carrierHeight, color: style.carrierColor)
        }
    }
}

struct CodeLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeLabel(state: .filled(text: "2"))
            CodeLabel(state: .prompting)
            CodeLabel(state: .error(text: "3"))
        }
    }
}
