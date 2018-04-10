import Foundation

class Paper {
    var text: String = ""
    
    func append(newText: Character) {
        text.append(newText)
    }
    
    func erase(textToErase: String) {
        text = text.replacingOccurrences(of: textToErase + " ", with: "")
    }
}
