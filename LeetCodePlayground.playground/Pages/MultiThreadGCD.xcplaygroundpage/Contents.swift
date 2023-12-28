import Dispatch
import Foundation

// let semaphore = DispatchSemaphore(value: 1)
var array = [Int]()

DispatchQueue.global(qos: .background).async {
//    semaphore.wait()
    array.append(1)
//    semaphore.signal()
}

DispatchQueue.global(qos: .background).async {
//    semaphore.wait()
    array.append(2)
//    semaphore.signal()
}
