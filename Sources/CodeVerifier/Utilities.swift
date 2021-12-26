import Foundation
import SwiftUI

public extension EnvironmentValues {
    var secureCodeStyle: SecureCodeStyle {
        get { return self[SecureCodeStyleKey.self] }
        set { self[SecureCodeStyleKey.self] = newValue }
    }
}

public struct SecureCodeStyleKey: EnvironmentKey {
    public static let defaultValue: SecureCodeStyle = Styles.defaultStyle
}
