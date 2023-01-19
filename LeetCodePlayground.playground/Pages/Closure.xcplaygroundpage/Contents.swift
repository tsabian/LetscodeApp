//: [Previous](@previous)

import UIKit

class ClosureTest {
    // delegate
    var didSucceed: ((String) -> Void)?

    func valueDidSucceed(value: String) {
        didSucceed?(value)
    }
}

var test = ClosureTest()
// inicializa o delegate no escopo que vc precisa
test.didSucceed = { value in
    print(value)
}

// quando chamar a função executa com o valor que vc precisa
test.valueDidSucceed(value: "Teste")

// MARK: -  Controller

class CustomField: UITextField {
    var didSuccess: ((String) -> Void)?
}

class controller {
    @IBOutlet var currencyField: CustomField? {
        didSet {
            currencyField?.didSuccess = { value in
                self.doSomething(with: value)
            }
        }
    }

    func doSomething(with value: String) {
        print(value)
    }
}
