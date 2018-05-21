import Quick
import Nimble
@testable import PencilDurabilitySwift

class PencilDurabilitySwiftTests: QuickSpec {
    
    override func spec() {
        
        describe("write") {
            
            context("given a piece of paper") {
                var pencil: Pencil!
                var paper: Paper!
                
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
                var pencil: Pencil!
                var paper: Paper!

                beforeEach {
                    paper = Paper()
                    pencil = Pencil(point: 100)
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
                
                it("uppercase characters count as 2 points") {
                    let pencil = Pencil(point: 5)
                    let result = pencil.write(paper: paper, text: "TExt")
                    expect(result.text).to(equal("TEx "))
                }
                
                it("does not reduce a point when writing a space") {
                    let pencil = Pencil(point: 2)
                    let result = pencil.write(paper: paper, text: "t te")
                    expect(result.text).to(equal("t t "))
                }
                
                it("does not reduce a point when writing a new line") {
                    let pencil = Pencil(point: 2)
                    let result = pencil.write(paper: paper, text: "t\nte")
                    expect(result.text).to(equal("t\nt "))
                }
                
                it("reduces a point for \\") {
                    let pencil = Pencil(point: 2)
                    let result = pencil.write(paper: paper, text: "t\\te")
                    expect(result.text).to(equal("t\\  "))
                }
            }
        }
        describe("sharpen") {
            var pencil: Pencil!
            var paper: Paper!
            
            beforeEach {
                pencil = Pencil(point: 100)
                paper = Paper()
            }
            
            it("can sharpen to original sharpness") {
                let pencil = Pencil(point: 2)
                let _ = pencil.write(paper: paper, text: "tt")
                pencil.sharpen()
                
                expect(pencil.point).to(equal(2))
            }
            
            it("can sharpen to original sharpness with a new initial value") {
                let pencil = Pencil(point: 3)
                let _ = pencil.write(paper: paper, text: "tt")
                pencil.sharpen()
                
                expect(pencil.point).to(equal(3))
            }
            
            it("can sharpen the number of times equal to length") {
                let pencil = Pencil(point: 3)
                pencil.sharpen()
                pencil.sharpen()
                pencil.sharpen()

                expect(pencil.point).to(equal(3))
            }
            
            it("cannot sharpen more times than its length") {
                let pencil = Pencil(point: 3)
                pencil.sharpen()
                pencil.sharpen()
                pencil.sharpen()
                let _ = pencil.write(paper: paper, text: "tt")
                pencil.sharpen()
                
                expect(pencil.point).to(equal(1))
            }
        }
        
        describe("erase") {
            var pencil: Pencil!
            var paper: Paper!
            
            beforeEach {
                pencil = Pencil(point: 100)
                paper = Paper()
            }
            
            it("can erase a word") {
                paper.text = "the fox jumped over the lamb"
                paper.erase(textToErase: "jumped")
                
                expect(paper.text).to(equal("the fox over the lamb"))
            }
            
            it("will erase the last occurance of the word") {
                paper.text = "the sun the moon the stars"
                paper.erase(textToErase: "the")
                
                expect(paper.text).to(equal("sun the moon the stars"))
                
                paper.erase(textToErase: "the")
                
                expect(paper.text).to(equal("sun moon the stars"))
                
                paper.erase(textToErase: "the")
                
                expect(paper.text).to(equal("sun moon stars"))
            }
        }
    }
}
