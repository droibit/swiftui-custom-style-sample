// swiftlint:disable identifier_name
import SwiftUI

enum FloatingActionButtonType {
    case `default`, extended
}

private extension FloatingActionButtonType {
    var shape: some Shape {
        switch self {
        case .default: AnyShape(Circle())
        case .extended: AnyShape(RoundedRectangle(cornerRadius: 16.0))
        }
    }
}

enum FloatingActionButtonSize {
    case mini, standartd
}

private extension FloatingActionButtonSize {
    var length: CGFloat {
        switch self {
        case .mini: 40
        case .standartd: 56
        }
    }

    var shadowRadius: CGFloat {
        switch self {
        case .mini: 3.5
        case .standartd: 6
        }
    }
}

struct FloatingActionButtonStyle: ButtonStyle {
    private let type: FloatingActionButtonType
    private let size: FloatingActionButtonSize
    private let role: ButtonRole

    @Environment(\.isEnabled)
    private var isEnabled: Bool

    init(
        type: FloatingActionButtonType,
        size: FloatingActionButtonSize,
        role: ButtonRole
    ) {
        self.type = type
        self.size = size
        self.role = role
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: size.length, height: size.length)
            .background(role.backgroundColor(disabled: !isEnabled))
            .foregroundColor(role.foregroundColor(disabled: !isEnabled))
            .clipShape(type.shape)
            .shadow(radius: size.shadowRadius, x: 0, y: 3)
    }
}

extension ButtonStyle where Self == FloatingActionButtonStyle {
    static func fab(
        _ type: FloatingActionButtonType = .default,
        size: FloatingActionButtonSize = .standartd,
        role: ButtonRole = .primary
    ) -> Self {
        .init(type: type, size: size, role: role)
    }
}

struct FloatingActionButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 12.0) {
            VStack(spacing: 12.0) {
                HStack {
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .standartd, role: .primary))
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .standartd, role: .secondary))
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .standartd))
                        .disabled(true)
                }
                HStack {
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .mini, role: .primary))
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .mini, role: .secondary))
                    iconButton("plus")
                        .buttonStyle(.fab(.extended, size: .mini))
                        .disabled(true)
                }

                HStack {
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .standartd, role: .primary))
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .standartd, role: .secondary))
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .standartd))
                        .disabled(true)
                }

                HStack {
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .mini, role: .primary))
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .mini, role: .secondary))
                    iconButton("minus")
                        .buttonStyle(.fab(.default, size: .mini))
                        .disabled(true)
                }
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }

    private static func iconButton(_ systemName: String) -> some View {
        Button {} label: {
            Image(systemName: systemName)
                .bold()
        }
    }
}
