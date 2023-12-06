import Foundation

public extension Date {
    func toString(format: String, locale: Locale = Locale(identifier: "pt_BR")) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    func toString(
        withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
        in timeZone: String = Calendar.current.timeZone.identifier
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: timeZone)
        return formatter.string(from: self)
    }

    func relativeDate(timeInternal: Int) -> String? {
        guard let date = Calendar.current.date(byAdding: .minute, value: timeInternal, to: self) else {
            return nil
        }
        let dateFormmatter = DateFormatter()
        dateFormmatter.locale = Locale(identifier: "pt_BR")
        dateFormmatter.timeStyle = .none
        dateFormmatter.dateStyle = .medium
        dateFormmatter.doesRelativeDateFormatting = true
        return dateFormmatter.string(from: date)
    }

    func microsecondsDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.'MICROS'xx"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        let dateComponent = Calendar.current.dateComponents([.nanosecond], from: self)
        let microseconds = Int(Double(dateComponent.nanosecond! / 1000).rounded(.toNearestOrEven))
        let secondsPart = String(microseconds).padding(toLength: 6, withPad: "0", startingAt: 0)
        var timeStamp = formatter.string(from: self)
        return timeStamp.replacingOccurrences(of: "MICROS", with: secondsPart)
    }
}
