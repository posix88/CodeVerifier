import SwiftUI

struct CodeLabel: View {
    
    let labelState: CodeLabelState
    let style: SecureCodeStyle
    
    private var lineColor: Color {
        labelState.showingError ? style.errorLineColor : style.normalLineColor
    }
    
    private var textColor: Color {
        labelState.showingError ? style.errorTextColor : style.normalTextColor
    }
    
    public var body: some View {
        VStack(spacing: style.carrierSpacing) {
            if !labelState.prompting {
                Text(labelState.textLabel)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .frame(width: style.labelWidth, height: style.labelHeight, alignment: .center)
            } else {
                Carrier(height: style.carrierHeight, color: style.carrierColor)
            }
            Rectangle()
                .frame(width: style.lineWidth, height: style.lineHeight)
                .foregroundColor(lineColor)
        }
    }
}

struct CodeLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CodeLabel(labelState: .filled(text: "2"), style: Styles.defaultStyle)
            CodeLabel(labelState: .prompting, style: Styles.defaultStyle)
            CodeLabel(labelState: .error(text: "3"), style: Styles.defaultStyle)
        }
    }
}
