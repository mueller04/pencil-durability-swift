import Foundation

class Pencil {
    var point: Int
    
    init(point: Int) {
        self.point = point
    }
    
    func write(paper: Paper, text: String) -> Paper {
        
        for char in text {
            if (point > 0) {
                paper.text.append(char)
                point = point - 1
            } else {
                paper.text.append(" ")
            }
        }
        
        return paper
    }    
}

