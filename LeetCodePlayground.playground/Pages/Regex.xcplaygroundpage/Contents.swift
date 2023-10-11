import Foundation

let pattern = "(?-i)((bitzminiapp://open[?])([url]{3,}=))"
let regexTest = "bitzminiapp://open?url=https://www.uol.com.br"
let matches = regexTest.matches(for: pattern)
let newTest = regexTest.stringByReplacingRegexMatches(pattern: pattern, with: "")

let texto = NSMutableString(string: "985784655")
let range = NSRange(location: 0 % texto.length, length: 11 % texto.length)
if texto.length > range.length, texto.length > range.location {
    texto.deleteCharacters(in: range)
}

// MARK: - HTTP|HTTPS Pattern

let webURLPattern = "^(?i)https?://"
let urlStringCollection = [
    "http://www.site.com.br",
    "HTTP://www.site.com.br",
    "https://www.site.com.br",
    "HTTPS://www.site.com.br",
    "https://site.com.br",
    "tel://0800808080",
    "ios://app",
    "ftp://site.com.br",
    "tel://080000000?url=http://host",
]
for (index, urlString) in urlStringCollection.enumerated() {
    print("\(index): \(urlString), isInvalidWebURL = \(urlString.match(for: webURLPattern))")
}

urlStringCollection[0].match(for: webURLPattern)
urlStringCollection[8].match(for: webURLPattern)
