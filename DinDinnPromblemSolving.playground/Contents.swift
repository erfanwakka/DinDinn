import UIKit

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
extension String {
    func replaceCharsBy(nTimes n: Int) -> String {
        //assumed lowercase letters only
        //O(n) where n is the length of string
        let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        var str = self
        for (index, char) in str.enumerated() {
            guard let charIndexInAlphabet = alphabet.firstIndex(of: "\(char)") else { return str }
            let indexToBeReplaced = (charIndexInAlphabet + n) % alphabet.count
            let charIndex = str.index(str.startIndex, offsetBy: index)
            str.replaceSubrange(charIndex...charIndex, with: alphabet[indexToBeReplaced])
        }
        return str
    }
    /* Common problem using ASCII is that we cannot support other languages or special characters but in above solution we can provide any kind of letters and extend it
     */
    func ASCIIreplaceCharsBy(nTimes n: Int) -> String {
        //assumed lowercase letters only
        //O(n) where n is the length of string
        var str = self
        for (index, char) in str.enumerated() {
            let indexToBeReplaced = UInt8((Int(char.asciiValue ?? 97) + n) % 122)
            let charIndex = str.index(str.startIndex, offsetBy: index)
            str.replaceSubrange(charIndex...charIndex, with: String(UnicodeScalar(UInt8(indexToBeReplaced))))
        }
        return str
    }
}


"aabbcc".replaceCharsBy(nTimes: 2)
"aabbcc".ASCIIreplaceCharsBy(nTimes: 2)
