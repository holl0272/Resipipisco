import Foundation


// 1 = I
// 2 = II
// 3 = III
// 4 = IV
// 5 = V
// 6 = VI
// 7 = VII
// 8 = VIII
// 9 = IX
// 10 = X



let romans = [
    1:"I",
    4:"IV",
    5:"V",
    9:"IX",
    10:"X",
    40:"XL",
    50:"L",
    90:"XC",
    100:"C",
    400:"CD",
    500:"D",
    900:"CM",
    1000:"M"
]

let decimals = [1,4,5,9,10,40,50,90,100,400,500,900,1000]


func decimalToRoman(toConvert:Int) -> String {
    var roman = ""
    var toTest = toConvert
    for dec in decimals.reverse() {
        let num = toTest / dec
        let rem = toTest % dec
        if num > 0 {
            let romanDigit = romans[dec]!
            for ix in 0..<num {
                roman += romanDigit
            }
            toTest = rem
        }
    }
    
    return roman
}

decimalToRoman(94)
decimalToRoman(115)
decimalToRoman(9)
decimalToRoman(12)
decimalToRoman(24)
decimalToRoman(44)
decimalToRoman(999)
decimalToRoman(707)
decimalToRoman(401)




let testCases = [
    1: "I",
    2: "II",
    3: "III",
    4: "IV",
    5: "V",
    6: "VI",
    7: "VII",
    8: "VIII",
    9: "IX",
    10: "X",
    11: "XI",
    12: "XII",
    13: "XIII",
    14: "XIV",
    15: "XV",
    16: "XVI",
    17: "XVII",
    18: "XVIII",
    19: "XIX",
    20: "XX",
    21: "XXI",
    22: "XXII",
    23: "XXIII",
    24: "XXIV",
    25: "XXV",
    26: "XXVI",
    27: "XXVII",
    28: "XXVIII",
    29: "XXIX",
    30: "XXX",
    31: "XXXI",
    32: "XXXII",
    33: "XXXIII",
    34: "XXXIV",
    35: "XXXV",
    36: "XXXVI",
    37: "XXXVII",
    38: "XXXVIII",
    39: "XXXIX",
    40: "XL",
    41: "XLI",
    42: "XLII",
    43: "XLIII",
    44: "XLIV",
    45: "XLV",
    46: "XLVI",
    47: "XLVII",
    48: "XLVIII",
    49: "XLIX",
    50: "L",
    51: "LI",
    52: "LII",
    53: "LIII",
    54: "LIV",
    55: "LV",
    56: "LVI",
    57: "LVII",
    58: "LVIII",
    59: "LIX",
    60: "LX",
    61: "LXI",
    62: "LXII",
    63: "LXIII",
    64: "LXIV",
    65: "LXV",
    66: "LXVI",
    67: "LXVII",
    68: "LXVIII",
    69: "LXIX",
    70: "LXX",
    71: "LXXI",
    72: "LXXII",
    73: "LXXIII",
    74: "LXXIV",
    75: "LXXV",
    76: "LXXVI",
    77: "LXXVII",
    78: "LXXVIII",
    79: "LXXIX",
    80: "LXXX",
    81: "LXXXI",
    82: "LXXXII",
    83: "LXXXIII",
    84: "LXXXIV",
    85: "LXXXV",
    86: "LXXXVI",
    87: "LXXXVII",
    88: "LXXXVIII",
    89: "LXXXIX",
    90: "XC",
    91: "XCI",
    92: "XCII",
    93: "XCIII",
    94: "XCIV",
    95: "XCV",
    96: "XCVI",
    97: "XCVII",
    98: "XCVIII",
    99: "XCIX",
    100: "C",
    200: "CC",
    300: "CCC",
    400: "CD",
    500: "D",
    600: "DC",
    700: "DCC",
    800: "DCCC",
    900: "CM",
    1000: "M",

    1100: "MC",
    1200: "MCC",
    1300: "MCCC",
    1400: "MCD",
    1500: "MD",
    1600: "MDC",
    1700: "MDCC",
    1800: "MDCCC",
    1900: "MCM",
    1990: "MCMXC",
    1991: "MCMXCI",
    1992: "MCMXCII",
    1993: "MCMXCIII",
    1994: "MCMXCIV",
    1995: "MCMXCV",
    1996: "MCMXCVI",
    1997: "MCMXCVII",
    1998: "MCMXCVIII",
    1999: "MCMXCIX",
    2000: "MM",
    2001: "MMI",
    2002: "MMII",
    2003: "MMIII",
    2004: "MMIV",
    2005: "MMV",
    2006: "MMVI",
    2007: "MMVII",
    2008: "MMVIII",
    2009: "MMIX",
    2010: "MMX",
    2011: "MMXI",
    2012: "MMXII",
    2013: "MMXIII",
    2014: "MMXIV",
    2015: "MMXV",
    2016: "MMXVI",
    2017: "MMXVII",
    2018: "MMXVIII",
    2019: "MMXIX",
    2020: "MMXX"
]

var passedAll = true
for (dec, expectedRoman) in testCases {
    let computedRom = decimalToRoman(dec)
    if expectedRoman != computedRom {
        passedAll = false
        println("Failed! \(dec) != \(computedRom), expected \(expectedRoman)")
        break
    }
}
passedAll

