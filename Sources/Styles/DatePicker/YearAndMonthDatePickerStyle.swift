import SwiftUI
import UIKit

@available(iOS 17.4, *)
struct YearAndMonthDatePickerStyle: DatePickerStyle {
    func makeBody(configuration: Configuration) -> some View {
        YearAndMonthDatePicker(
            selection: configuration.$selection,
            minimumDate: configuration.minimumDate,
            maximumDate: configuration.maximumDate
        )
    }
}

@available(iOS 17.4, *)
extension DatePickerStyle where Self == YearAndMonthDatePickerStyle {
    static var yearAndMonth: YearAndMonthDatePickerStyle {
        .init()
    }
}

@available(iOS 17.4, *)
struct YearAndMonthDatePicker: UIViewRepresentable {
    @Binding private var selection: Date
    private var minimumDate: Date?
    private var maximumDate: Date?

    init(
        selection: Binding<Date>,
        minimumDate: Date? = nil,
        maximumDate: Date? = nil
    ) {
        _selection = selection
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
    }

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .yearAndMonth
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged(sender:)), for: .valueChanged)
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.date = selection
        datePicker.locale = context.environment.locale
        datePicker.timeZone = context.environment.timeZone
        return datePicker
    }

    func updateUIView(_ uiView: UIDatePicker, context: Context) {}

    func makeCoordinator() -> Coordinator {
        .init(parent: self)
    }

    class Coordinator: NSObject {
        var parent: YearAndMonthDatePicker

        init(parent: YearAndMonthDatePicker) {
            self.parent = parent
        }

        @objc
        func dateChanged(sender: UIDatePicker) {
            parent.selection = sender.date
        }
    }
}

@available(iOS 17.4, *)
struct YearAndMonthDatePickerStyle_Previews: PreviewProvider {
    @State private static var showsPicker = true
    static var previews: some View {
        VStack {
            if showsPicker {
                DatePicker(
                    "",
                    selection: .constant(Date()),
                    // 2020-12-22 18:20:00 UTC
                    in: Date(timeIntervalSince1970: 1_608_628_800)...
                )
                .datePickerStyle(.yearAndMonth)
                .environment(\.locale, .init(identifier: "ja_JP"))
            }

            DatePicker(
                "",
                selection: .constant(Date()),
                // 2020-12-22 18:20:00 UTC
                in: Date(timeIntervalSince1970: 1_608_628_800)...
            )
            .datePickerStyle(.yearAndMonth)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
