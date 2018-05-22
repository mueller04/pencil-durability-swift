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
}
