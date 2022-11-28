//
// Created by Ángel Vázquez on 27/11/22.
//

import RayTracer
import XCTest

struct Canvas {
    let width: Int
    let height: Int
    let pixels: [[Color]]

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.pixels = [[Color]](repeating: [Color](repeating: .black, count: width), count: height)
    }
}

class CanvasTests: XCTestCase {
    func test_init_createsCanvasWithSpecifiedSizeAndAllPixelsBlack() {
        let width = 10
        let height = 20
        let canvas = Canvas(width: width, height: height)

        XCTAssertEqual(canvas.width, 10)
        XCTAssertEqual(canvas.height, 20)

        for y in 0..<height {
            for x in 0..<width {
                XCTAssertEqual(canvas.pixels[y][x], .black, "Color is not black at position (\(x), \(y))")
            }
        }
    }
}
