import Foundation

class Pencil {
    var point: Int
    var initialPoint: Int
    var length: Int = 3
    var eraser: Int
    
    init(point: Int, eraser: Int = 4) {
        self.point = point
        self.initialPoint = point
        self.eraser = eraser
    }
    
    func write(paper: Paper, text: String) -> Paper {
        
        for (_, char) in text.enumerated() {
            
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
    
    func sharpen() -> Void {
        if length > 0 {
            point = initialPoint
            length = length - 1
        }
    }
    
    func erase(paper: Paper, textToErase: String) -> Paper {
        
        let separatedString = paper.text.components(separatedBy: " ").reversed()
        
        var newTextArray: [String] = []
        var foundWord: Bool = false
        
        for word in separatedString {
            if word == textToErase && !foundWord {
                foundWord = true
                
                if word.count > eraser {
                    newTextArray = erasePartialWord(word: word, textArray: newTextArray)
                }

            } else {
                newTextArray.append(trim(word: word))
            }
        }
        
        newTextArray = newTextArray.reversed()
        let resultingString = newTextArray.flatMap({$0}).joined(separator: " ")
        paper.text = trim(word: resultingString)

        return paper
    }
    
    private func appendSpace(paper: Paper) {
        paper.append(newText: " ")
    }
    
    private func trim(word: String) -> String {
        return word.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    private func erasePartialWord(word: String, textArray: [String]) -> [String] {
        var retArray = textArray
        let wordChars = Array(word).reversed()
        var nonErasedWordChars: [String] = []
        
        for char in wordChars {
            if (eraser > 0) {
                eraser = eraser - 1
            } else {
                nonErasedWordChars.append(String(char))
            }
        }
        
        let resultingNonErasedWord = String(nonErasedWordChars.flatMap({$0}).joined().reversed())
        retArray.append(trim(word: resultingNonErasedWord))
        return retArray
    }
    
    private func eligibleToWriteUpperCaseLetter(char: Character, point: Int) -> Bool {
        let charString = String(char)
        return point > 1 && charString == charString.uppercased()
    }
}
