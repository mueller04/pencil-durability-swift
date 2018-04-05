import Foundation

class Pencil {
    var point: Int
    
    init(point: Int) {
        self.point = point
    }
    
    func write(paper: Paper, text: String) -> Paper {
        
        
        for char in text {
            
            if eligibleUpperCaseLetter(char: char, point: point) {
                paper.append(newText: char)
                    point = point - 2
            } else if point > 0 {
                if char == " " {
                    appendSpace(paper: paper)
                } else {
                    paper.append(newText: char)
                    point = point - 1
                }
            } else {
                appendSpace(paper: paper)
            }
        }
        return paper
    }
    
    private func appendSpace(paper: Paper) {
        paper.append(newText: " ")
    }
    
    private func eligibleUpperCaseLetter(char: Character, point: Int) -> Bool {
        let upperCase = CharacterSet.uppercaseLetters
        let unicodeChar = char.unicodeScalars.first!
        return point > 1 && upperCase.contains(unicodeChar)
    }
}

