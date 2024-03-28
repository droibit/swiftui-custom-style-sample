import Foundation

enum CustomStyleType: Hashable, CaseIterable {
    case button, textField, toggle
}

extension CustomStyleType: Identifiable, CustomStringConvertible {
    var id: Self {
        self
    }

    var description: String {
        switch self {
        case .button: "Button Style"
        case .textField: "Text Field Style"
        case .toggle: "Toggle Style"
        }
    }
}
