//: [Previous](@previous)

import Foundation

// echo -n "text" | xxd -p | sed 's/\(..\)/0x\1 /g'

let data = Data([
    0x62,
    0x72,
    0x2e,
    0x63,
    0x6f,
    0x6d,
    0x2e,
    0x62,
    0x72,
    0x61,
    0x64,
    0x65,
    0x73,
    0x63,
    0x6f,
    0x2e,
    0x61,
    0x70,
    0x70,
    0x2e,
    0x70,
    0x72,
    0x69,
    0x76,
    0x61,
    0x74,
    0x65,
])
let hexString = data.map { String(format: "%02x", $0) }.joined()
print(hexString)

measurePerformance {
    print(data.stringFromHex)
}.formattedTime

// echo -n "texto muito grande " | xxd -p

let keys = [
    "62722e636f6d2e627261646573636f2e6170702e70726976617465",
].joined()
print(keys)
print(keys.convertFromHexString)
