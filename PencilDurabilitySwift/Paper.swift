import Foundation

class Paper {
    var text: String = ""
    
    func append(newText: Character) {
        text.append(newText)
    }
    
    func erase(textToErase: String) {
        
        text = text.replacingOccurrences(of: textToErase + " ", with: "")
        
        
//        var strArray = text.components(separatedBy: " ")
//        
//        for char in strArray {
//            if char == textToErase {
//                
//            }
//        }
    }
}
