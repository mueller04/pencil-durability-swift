import Foundation

class Pencil {
    func write(paper: Paper, text: String) -> Paper {
        paper.text.append(text)
        return paper
    }    
}

