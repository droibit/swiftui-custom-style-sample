import SwiftUI

enum FilledButtonSize {
    case standard
    case customized(height: CGFloat, width: CGFloat?)
}

private extension FilledButtonSize {
    var height: CGFloat {
        switch self {
        case .standard: 40
        case let .customized(height, _): height
        }
    }

    var width: CGFloat? {
        switch self {
        case .standard: .infinity
        case let .customized(_, width): width
        }
    }
}

struct FilledButtonStyle: ButtonStyle {
    private let role: ButtonRole
    private let size: FilledButtonSize

    @Environment(\.isEnabled)
    private var isEnabled: Bool
    @Environment(\.font)
    private var font: Font?

    init(role: ButtonRole, size: FilledButtonSize) {
        self.role = role
        self.size = size
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font ?? .body.bold())
//            .bold(font == nil)
            .padding()
            .frame(maxWidth: size.width, maxHeight: size.height)
            .background(role.backgroundColor(disabled: !isEnabled))
            .foregroundColor(role.foregroundColor(disabled: !isEnabled))
            .clipShape(Capsule())
    }
}

extension ButtonStyle where Self == FilledButtonStyle {
    static func filled(
        _ role: ButtonRole = .primary,
        size: FilledButtonSize = .standard
    ) -> Self {
        .init(role: role, size: size)
    }
}

struct FilledButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8.0) {
            Button {} label: {
                Label("Add", systemImage: "plus")
                    .font(.body.weight(.heavy))
            }
            .buttonStyle(.filled(.primary, size: .standard))

            Button {} label: {
                Label("Add", systemImage: "plus")
            }
            .buttonStyle(.filled(.secondary, size: .standard))

            Button {} label: {
                Label("Add", systemImage: "plus")
                    .font(.body.weight(.thin))
            }
            .buttonStyle(.filled(.secondary, size: .standard))
            .disabled(true)

            HStack(spacing: 4.0) {
                Button {} label: {
                    Text("Add")
                }
                .font(.caption)
                .buttonStyle(.filled(.primary, size: .customized(height: 25, width: nil)))

                Button {} label: {
                    Label("Add", systemImage: "plus")
                }
                .font(.caption.bold())
                .buttonStyle(.filled(.secondary, size: .customized(height: 25, width: nil)))

                Button {} label: {
                    Image(systemName: "plus")
                }
                .font(.caption.bold())
                .buttonStyle(.filled(.secondary, size: .customized(height: 25, width: 40)))
                .disabled(true)
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }

    private static func button(systemImage: String, title: String) -> some View {
        Button {} label: {
            Image(systemName: systemImage)
        }
    }
}
