import SwiftUI

enum CheckboxShape {
    case square, circle
}

extension CheckboxShape {
    func systemImageName(isOn: Bool) -> String {
        switch self {
        case .square: isOn ? "checkmark.square.fill" : "square"
        case .circle: isOn ? "checkmark.circle.fill" : "circle"
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    private let shape: CheckboxShape
    private let checkboxAlignment: VerticalAlignment

    init(
        shape: CheckboxShape,
        checkboxAlignment: VerticalAlignment
    ) {
        self.shape = shape
        self.checkboxAlignment = checkboxAlignment
    }

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: checkboxAlignment, spacing: 8.0) {
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: shape.systemImageName(isOn: configuration.isOn))
                    .resizable()
                    .font(.system(size: 18.0, weight: .semibold))
                    .frame(width: 20, height: 20)
            }

            configuration.label
        }
    }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
    static func checkbox(
        _ shape: CheckboxShape = .square,
        alignment: VerticalAlignment = .top
    ) -> Self {
        .init(shape: shape, checkboxAlignment: alignment)
    }
}

struct CheckboxToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
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
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
