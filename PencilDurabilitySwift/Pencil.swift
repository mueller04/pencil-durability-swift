import Foundation

class Pencil {
    var point: Int
    
    init(point: Int) {
        self.point = point
    }
    
    func write(paper: Paper, text: String) -> Paper {
        
        
        for (i, char) in text.enumerated() {
            
            if eligibleToWriteUpperCaseLetter(char: char, point: point) {
                paper.append(newText: char)
                    point = point - 2
            } else if point > 0 {
                
        
                if char == "\n"{
                    paper.append(newText: char)
                } else if char == " " {
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
    
    private func eligibleToWriteUpperCaseLetter(char: Character, point: Int) -> Bool {
        let charString = String(char)
        return point > 1 && charString == charString.uppercased()
    }
}

