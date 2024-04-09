import SwiftUI

struct LinkButtonStyle: ButtonStyle {
    private let tint: Color

    init(tint: Color) {
        self.tint = tint
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .underline(true)
            .foregroundColor(tint)
            .padding()
    }
}

extension ButtonStyle where Self == LinkButtonStyle {
    static func link(_ tint: Color = .accentColor) -> Self {
        .init(tint: tint)
    }
}

struct LinkButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Button("Link") {}
                .buttonStyle(.link())

            Button {} label: {
                Label("Link", systemImage: "plus")
            }
            .buttonStyle(.link(.red))
        }
        .previewLayout(.sizeThatFits)
    }
}
