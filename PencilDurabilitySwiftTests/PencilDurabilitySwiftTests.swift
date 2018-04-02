import Quick
import Nimble
@testable import PencilDurabilitySwift

class PencilDurabilitySwiftTests: QuickSpec {
    
    override func spec() {
        
        describe("write") {
            
            context("given a piece of paper") {
                var pencil = Pencil(point: 100)
                var paper = Paper()
                
                beforeEach {
                    pencil = Pencil(point: 100)
                    paper = Paper()
                    paper.text = "a "
                }
                
                it("should write a character") {
                    let result = pencil.write(paper: paper, text: "t")
                    expect(result.text).to(equal("a t"))
                }
                
                it("should write several characters") {
                    let result = pencil.write(paper: paper, text: "text")
                    expect(result.text).to(equal("a text"))
                }
            }
            
            context("point degradation") {
                var paper = Paper()
                
                beforeEach {
                    paper = Paper()
                }
                
                it("should be able to write all lowercase characters") {
                    let pencil = Pencil(point: 4)
                    let result = pencil.write(paper: paper, text: "text")
                    expect(result.text).to(equal("text"))
                }
                
                it("should not able to write all lowercase characters") {
                    let pencil = Pencil(point: 4)
                    let result = pencil.write(paper: paper, text: "textes")
                    expect(result.text).to(equal("text  "))
                }
            }
        }
    }
}
