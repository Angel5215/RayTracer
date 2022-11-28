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
        self.pixels = [[Color]](
            repeating: [Color](repeating: color(red: 0, green: 0, blue: 0), count: width),
            count: height
        )
    }
}

class CanvasTests: XCTestCase {
    func test_init_createsCanvasWithSpecifiedSizeAndAllPixelsBlack() {
        let canvas = Canvas(width: 10, height: 20)

        let allPixelsAreBlack = canvas.pixels.flatMap { $0 }.allSatisfy { $0 == color(red: 0, green: 0, blue: 0) }

        XCTAssertEqual(canvas.width, 10)
        XCTAssertEqual(canvas.height, 20)
        XCTAssertTrue(allPixelsAreBlack)
    }
}
