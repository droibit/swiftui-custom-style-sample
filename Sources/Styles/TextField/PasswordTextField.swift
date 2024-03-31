import SwiftUI

struct PasswordTextField: View {
    private enum FocusableTextField: Hashable {
        case secureField, textField
    }

    @State private var isSecured = true
    @FocusState private var actualFocusedTextField: FocusableTextField?
    @Binding private var text: String
    private var title: String

    init(_ title: String, text: Binding<String>) {
        _text = text
        self.title = title
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                        .focused($actualFocusedTextField, equals: .secureField)
                } else {
                    TextField(title, text: $text)
                        .focused($actualFocusedTextField, equals: .textField)
                }
            }
            .keyboardType(.asciiCapable)
            .autocapitalization(.none)
            .autocorrectionDisabled()
            .textFieldPadding()
            .padding(.trailing, 32.0)

            Button {
                isSecured.toggle()
            } label: {
                Image(systemName: isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
            .frame(width: TextFieldPaddingModifier.paddingHorizontal + 32.0)
        }
        .onChange(of: isSecured) { isSecured in
            // ref. https://softwareanders.com/swiftui-password-show-and-hide/
            actualFocusedTextField = isSecured ? .secureField : .textField
        }
        .underlinedTetxtField(focused: actualFocusedTextField != nil)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    @FocusState private static var focused: Bool

    static var previews: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            PasswordTextField(
                "Enter a password",
                text: .constant("")
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
