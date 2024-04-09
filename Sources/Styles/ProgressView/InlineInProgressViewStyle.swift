import SwiftUI

struct InlineInProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .foregroundColor(.primary)
            .font(.subheadline)
            .padding()
    }
}

extension ProgressViewStyle where Self == InlineInProgressViewStyle {
    static var inlineInProgress: InlineInProgressViewStyle {
        .init()
    }
}

struct InlineProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.inlineInProgress)

            ProgressView("Loading...")
                .progressViewStyle(.inlineInProgress)
        }
    }
}
