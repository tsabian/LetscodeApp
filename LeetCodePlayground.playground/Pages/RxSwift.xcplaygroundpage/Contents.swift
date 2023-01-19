//: [Previous](@previous)

import RxSwift

let observable = Observable.from([1, 2, 3, 4, 5, 6, 7, 8, 9])

let bag = DisposeBag()

observable.subscribe { event in
    guard let element = event.element else {
        return
    }
    print(element)
}.disposed(by: bag)
