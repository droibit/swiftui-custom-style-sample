import SwiftUI

struct TextFieldScreen: View {
    var body: some View {
        ScrollView {
            underlinedTextFields()
                .padding(.top)

            passwordTextFields()
                .padding(.top)
        }
        .navigationTitle(CustomStyleType.textField.description)
    }

    private func underlinedTextFields() -> some View {
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
        .padding(.horizontal)
    }

    private func passwordTextFields() -> some View {
        VStack(alignment: .leading, spacing: 8.0) {
            PasswordTextField(
                "Enter a password",
                text: .constant("")
            )
        }
        .padding(.horizontal)
    }
}

struct TextFieldScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TextFieldScreen()
        }
    }
}
