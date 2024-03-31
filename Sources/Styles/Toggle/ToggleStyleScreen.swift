import SwiftUI

struct ToggleStyleScreen: View {
    var body: some View {
        ScrollView {
            checkboxes()
        }
        .navigationTitle(CustomStyleType.toggle.description)
    }

    private func checkboxes() -> some View {
        VStack {
            HStack(alignment: .top, spacing: 8.0) {
                Toggle("Checkbox", isOn: .constant(false))

                Toggle("Checkbox\nCheckbox", isOn: .constant(true))
            }
            .toggleStyle(.checkbox())
            .tint(.red)

            Toggle("Checkbox", isOn: .constant(true))
                .toggleStyle(.checkbox(.circle))
            Toggle("Checkbox\nCheck", isOn: .constant(false))
                .toggleStyle(.checkbox(.circle, alignment: .firstTextBaseline))
                .font(.title)
            Toggle("Checkbox\nCheck", isOn: .constant(false))
                .toggleStyle(.checkbox(.circle, alignment: .firstTextBaseline))
                .font(.largeTitle)
        }
        .padding(.horizontal)
    }
}

struct ToggleStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ToggleStyleScreen()
        }
    }
}
