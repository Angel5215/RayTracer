//
// Created by Ángel Vázquez on 27/11/22.
//

import RayTracer
import XCTest

struct Canvas {
    typealias Position = (x: Int, y: Int)
    let width: Int
    let height: Int
    var pixels: [[Color]]

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.pixels = [[Color]](repeating: [Color](repeating: .black, count: width), count: height)
    }

    mutating func writePixel(with color: Color, at position: Canvas.Position) {
        pixels[position.y][position.x] = color
    }

    func pixel(at position: Canvas.Position) -> Color {
        pixels[position.y][position.x]
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

    func test_writePixel_changesIndividualPixelAtSpecifiedPosition() {
        var canvas = Canvas(width: 10, height: 20)
        let red = color(red: 1, green: 0, blue: 0)

        canvas.writePixel(with: red, at: (x: 2, y: 3))

        XCTAssertEqual(canvas.pixel(at: (x: 2, y: 3)), red)
    }
}
