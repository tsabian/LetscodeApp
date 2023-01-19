import Foundation

let pattern = "(?-i)((bitzminiapp://open[?])([url]{3,}=))"
let regexTest = "bitzminiapp://open?url=https://www.uol.com.br"
let matches = regexTest.matches(for: pattern)
let newTest = regexTest.stringByReplacingRegexMathes(pattern: pattern, with: "")

let texto = NSMutableString(string: "985784655")
let range = NSRange(location: 0 % texto.length, length: 11 % texto.length)
if texto.length > range.length, texto.length > range.location {
    texto.deleteCharacters(in: range)
}
