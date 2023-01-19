import Foundation

let miniAppNames = [
    "Recarga de Celular",
    "Indique e ganhe",
    "Empréstimo Losango",
    "Outro que não tem na lista",
]

guard let url = Bundle.main.url(forResource: "mini_app_analytics", withExtension: "json"),
      let dictionary = try? HelpCenterModel(fromURL: url)
else {
    print("deu ruim")
    fatalError()
}

var name = ""
var fromDictionary = ""
var found: HelpCenterModelElement?

do {
    let time = measurePerformance {
        name = miniAppNames[0].lowercased().components(separatedBy: .whitespaces).joined()
    }
    print("components joined", name, time)
}

do {
    let time = measurePerformance {
        name = miniAppNames[0].lowercased().replacingOccurrences(of: " ", with: "")
    }
    print("replacingOccurrences", name, time)
}

do {
    let time = measurePerformance {
        name = miniAppNames[0].lowercased().split(separator: " ").joined()
    }
    print("split joined", name, time)
}

do {
    let time = measurePerformance {
        found = dictionary.first(where: {
            $0.name.lowercased().components(separatedBy: .whitespaces).joined() == name
        })
        fromDictionary = found?.label ?? name
    }
    print("first components joined", found?.label ?? "", time)
}

do {
    let time = measurePerformance {
        found = dictionary.first(where: {
            $0.name.lowercased().replacingOccurrences(of: " ", with: "") == name
        })
        fromDictionary = found?.label ?? name
    }
    print("first replacingOccurrences", found?.label ?? "", time)
}

do {
    let time = measurePerformance {
        found = dictionary.first(where: {
            $0.name.lowercased().split(separator: " ").joined() == name
        })
        fromDictionary = found?.label ?? name
    }
    print("first split joined", found?.label ?? "", time)
}

print(fromDictionary)
