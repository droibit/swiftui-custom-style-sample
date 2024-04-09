import SwiftUI

struct ButtonStyleScreen: View {
    var body: some View {
        ScrollView {
            fabs()
                .padding(.top)

            filledButtons()
                .padding(.top)

            linkButtons()
                .padding(.top)
        }
        .navigationTitle(CustomStyleType.button.description)
    }

    private func fabs() -> some View {
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
        .padding(.horizontal)
    }

    private func filledButtons() -> some View {
        VStack(spacing: 8.0) {
            labeledButton("Add", systemImage: "plus")
                .font(.body.weight(.heavy))
                .buttonStyle(.filled(.primary, size: .standard))

            labeledButton("Add", systemImage: "plus")
                .buttonStyle(.filled(.secondary, size: .standard))

            labeledButton("Add", systemImage: "plus")
                .font(.body.weight(.thin))
                .buttonStyle(.filled(.secondary, size: .standard))
                .disabled(true)

            HStack(spacing: 4.0) {
                textButton("Add")
                    .font(.caption)
                    .buttonStyle(.filled(.primary, size: .customized(height: 25, width: nil)))

                labeledButton("Add", systemImage: "plus")
                    .font(.caption.bold())
                    .buttonStyle(.filled(.secondary, size: .customized(height: 25, width: nil)))

                iconButton("plus")
                    .font(.caption.bold())
                    .buttonStyle(.filled(.secondary, size: .customized(height: 25, width: 40)))
                    .disabled(true)
            }
        }
        .padding(.horizontal)
    }

    private func linkButtons() -> some View {
        HStack {
            Button("Link") {}
                .buttonStyle(.link())

            Button("Link") {}
                .buttonStyle(.link(.red))
        }
        .padding(.horizontal)
    }
}

private func iconButton(_ systemName: String) -> some View {
    Button {
        print("Button tapped")
    } label: {
        Image(systemName: systemName)
    }
}

private func textButton(_ title: String) -> some View {
    Button {
        print("Button tapped")
    } label: {
        Text(title)
    }
}

private func labeledButton(_ title: String, systemImage: String) -> some View {
    Button {
        print("Button tapped")
    } label: {
        Label(title, systemImage: systemImage)
    }
}

struct ButtonStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ButtonStyleScreen()
        }
    }
}
