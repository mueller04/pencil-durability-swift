import Foundation

class Pencil {
    var point: Int
    
    init(point: Int) {
        self.point = point
    }
    
    func write(paper: Paper, text: String) -> Paper {
        
        let upperCase = CharacterSet.uppercaseLetters
        
        for char in text.unicodeScalars {
            if point > 1 && upperCase.contains(char) {
                    paper.text.append(String(char))
                    point = point - 2
            } else if point > 0 {
                paper.text.append(String(char))
                point = point - 1
            } else {
                paper.text.append(" ")
            }
        }
        
        return paper
    }    
}

