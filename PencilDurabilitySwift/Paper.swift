import Foundation

extension String {
    var wordList: [String] {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).filter { !$0.isEmpty }
    }
}

class Paper {
    var text: String = ""
    
    func append(newText: Character) {
        text.append(newText)
    }
    
    func erase(textToErase: String) {
        
        let separatedString = text.components(separatedBy: " ")
        
        var newTextArray: [String] = []
        var foundWord: Bool = false
        
        for word in separatedString {
            if word == textToErase && !foundWord {
                foundWord = true
            } else {
                newTextArray.append(word)
            }            
        }
        
        text = newTextArray.flatMap({$0}).joined(separator: " ")
    }
}
