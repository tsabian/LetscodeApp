//: [Previous](@previous)

import Foundation
import Darwin

var elapsed = 30.0
Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    print(String(format: "%02d", Int(elapsed)))
    if (elapsed == Double.zero) {
        timer.invalidate()
    }
    elapsed -= timer.timeInterval
}
