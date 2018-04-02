import Foundation

class Pencil {
    func write(paper: Paper, text: Character) -> Paper {
        paper.text.append(text)
        return paper
    }    
}

