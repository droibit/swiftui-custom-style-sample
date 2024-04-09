import SwiftUI

struct ProgressViewScreen: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.inlineInProgress)

            ProgressView("Loading...")
                .progressViewStyle(.inlineInProgress)
        }
        .navigationTitle(CustomStyleType.progressView.description)
    }
}

struct ProgressViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProgressViewScreen()
        }
    }
}
