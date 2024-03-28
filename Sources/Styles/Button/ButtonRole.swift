//

import SwiftUI

enum ButtonRole {
    case primary, secondary
}

extension ButtonRole {
    func backgroundColor(disabled: Bool) -> Color {
        guard !disabled else {
            return .gray
        }

        return switch self {
        case .primary: .accentColor
        case .secondary: Color(uiColor: .systemGray6)
        }
    }

    func foregroundColor(disabled: Bool) -> Color {
        guard !disabled else {
            return .white
        }

        return switch self {
        case .primary: .white
        case .secondary: .black.opacity(0.68)
        }
    }
}
