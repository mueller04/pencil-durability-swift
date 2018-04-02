import Quick
import Nimble
@testable import PencilDurabilitySwift

class PencilDurabilitySwiftTests: QuickSpec {
    
    override func spec() {
        
        describe("write") {
            
            context("given a piece of paper") {
                var pencil = Pencil()
                var paper = Paper()
                
                beforeEach {
                    pencil = Pencil()
                    paper = Paper()
                    paper.text = "a "
                }
                
                it("should write a character") {
                    let result = pencil.write(paper: paper, text: "t")
                    expect(result.text).to(equal("a t"))
                }
            }
        }
    }
}
