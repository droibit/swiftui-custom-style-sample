import SwiftUI

public struct ContentView: View {
    @State private var navigationPath = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("Cusom Styles") {
                    ForEach(CustomStyleType.allCases) { type in
                        NavigationLink(type.description, value: type)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Sample")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationDestination(for: CustomStyleType.self) { type in
                switch type {
                case .button:
                    ButtonStyleScreen()
                case .toggle:
                    ToggleStyleScreen()
                default:
                    Text("Not implemented yet.")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
