import SwiftUI

struct UnderlinedTextFieldStyle: TextFieldStyle {
    private let focused: Bool
    private let hasHorizontalPadding: Bool

    init(
        focused: Bool,
        hasHorizontalPadding: Bool
    ) {
        self.focused = focused
        self.hasHorizontalPadding = hasHorizontalPadding
    }

    // swiftlint:disable identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldPadding(isActive: hasHorizontalPadding)
            .underlinedTetxtField(focused: focused)
    }
    // swiftlint:enable identifier_name
}

struct UnderlinedTetxtFieldModifier: ViewModifier {
    private let focused: Bool

    init(focused: Bool) {
        self.focused = focused
    }

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 0.8)
                    .foregroundColor(focused ? Color.accentColor : Color.gray.opacity(0.6))
            }
    }
}

extension View {
    func underlinedTetxtField(focused: Bool) -> some View {
        modifier(UnderlinedTetxtFieldModifier(focused: focused))
    }
}

extension TextFieldStyle where Self == UnderlinedTextFieldStyle {
    static func underlined(
        focused: Bool,
        hasHorizontalPadding: Bool = true
    ) -> UnderlinedTextFieldStyle {
        .init(focused: focused, hasHorizontalPadding: hasHorizontalPadding)
    }
}

struct UnderlinedTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            TextField("Test", text: .constant(""))
                .textFieldStyle(.underlined(focused: false))
            TextField("テスト", text: .constant(""))
                .textFieldStyle(.underlined(focused: true))

            HStack(spacing: 8.0) {
                TextField("YY", text: .constant(""))
                    .textFieldStyle(.underlined(focused: true))
                    .frame(width: 45.0)

                Text("/").foregroundStyle(.gray.opacity(0.6))

                TextField("MM", text: .constant(""))
                    .textFieldStyle(.underlined(focused: false))
                    .frame(width: 45.0)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
