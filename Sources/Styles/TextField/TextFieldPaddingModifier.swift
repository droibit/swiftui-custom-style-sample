import SwiftUI

struct TextFieldPaddingModifier: ViewModifier {
    static let paddingVertical: CGFloat = 5.0
    static let paddingHorizontal: CGFloat = 8.0

    private let isActive: Bool

    init(isActive: Bool) {
        self.isActive = isActive
    }

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, isActive ? Self.paddingHorizontal : 0.0)
            .padding(.vertical, Self.paddingVertical)
    }
}

extension View {
    func textFieldPadding(isActive: Bool = true) -> some View {
        modifier(TextFieldPaddingModifier(isActive: isActive))
    }
}
