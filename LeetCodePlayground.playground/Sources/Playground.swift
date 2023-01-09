import Foundation

public typealias MeasuringCompletion = () -> Void

public func measurePerformance(code: MeasuringCompletion) -> TimeInterval {
    let start = Date()
    code()
    let end = Date()
    return end.timeIntervalSince(start)
}
