//
// Created by Ángel Vázquez on 27/11/22.
//

import RayTracer
import XCTest

class CanvasTests: XCTestCase {
    func test_init_createsCanvasWithSpecifiedSizeAndAllPixelsBlack() {
        let width = 10
        let height = 20
        let canvas = Canvas(width: width, height: height)

        XCTAssertEqual(canvas.width, 10)
        XCTAssertEqual(canvas.height, 20)

        for y in 0..<height {
            for x in 0..<width {
                XCTAssertEqual(canvas.pixel(at: (x: x, y: y)), .black, "Color is not black at position (\(x), \(y))")
            }
        }
    }

    func test_writePixel_changesIndividualPixelAtSpecifiedPosition() {
        var canvas = Canvas(width: 10, height: 20)
        let red = color(red: 1, green: 0, blue: 0)

        canvas.writePixel(with: red, at: (x: 2, y: 3))

        XCTAssertEqual(canvas.pixel(at: (x: 2, y: 3)), red)
    }

    func test_ppm_constructsCorrectHeader() {
        let canvas = Canvas(width: 5, height: 3)

        let firstThreeLinesOfPPM = canvas.linesFromPPM(from: 1, to: 3)

        XCTAssertEqual(firstThreeLinesOfPPM, ["P3", "5 3", "255"])
    }

    func test_ppm_addsPixelDataWithClampedValues() {
        var canvas = Canvas(width: 5, height: 3)

        canvas.writePixel(with: color(red: 1.5, green: 0, blue: 0), at: (x: 0, y: 0))
        canvas.writePixel(with: color(red: 0, green: 0.5, blue: 0), at: (x: 2, y: 1))
        canvas.writePixel(with: color(red: -0.5, green: 0, blue: 1), at: (x: 4, y: 2))

        let ppmLines = canvas.linesFromPPM(from: 4, to: 6)

        XCTAssertEqual(ppmLines, [
            "255 0 0 0 0 0 0 0 0 0 0 0 0 0 0",
            "0 0 0 0 0 0 0 128 0 0 0 0 0 0 0",
            "0 0 0 0 0 0 0 0 0 0 0 0 0 0 255"
        ])
    }

    func test_ppm_splitsLinesSoThatNoneAreMoreThan70CharactersLong() {
        let canvas = Canvas(width: 10, height: 2, fillColor: color(red: 1, green: 0.8, blue: 0.6))

        let ppmLines = canvas.linesFromPPM(from: 4, to: 7)

        XCTAssertEqual(ppmLines, [
            "255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204",
            "153 255 204 153 255 204 153 255 204 153 255 204 153",
            "255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204",
            "153 255 204 153 255 204 153 255 204 153 255 204 153"
        ])
    }

    func test_ppm_endsWithNewlineCharacter() {
        let canvas = Canvas(width: 5, height: 3)

        XCTAssertTrue(canvas.ppm.hasSuffix("\n"))
    }

    func test_writePixel_doesNothingOnOutOfBoundsCoordinate() {
        let width = 5
        let height = 3
        var canvas = Canvas(width: width, height: height)

        canvas.writePixel(with: color(red: 0.5, green: 1, blue: 1), at: (x: 10, y: 2))
        canvas.writePixel(with: color(red: 0.5, green: 1, blue: 1), at: (x: 0, y: 20))
        canvas.writePixel(with: color(red: 0.5, green: 1, blue: 1), at: (x: 10, y: 30))

        for y in 0..<height {
            for x in 0..<width {
                XCTAssertEqual(canvas.pixel(at: (x: x, y: y)), .black, "Color is not black at position (\(x), \(y))")
            }
        }
    }

    func test_pixelAtPosition_returnsNilForPositionsOutsideCanvasBounds() {
        let canvas = Canvas(width: 5, height: 3)

        XCTAssertNil(canvas.pixel(at: (x: -1, y: 9)))
        XCTAssertNil(canvas.pixel(at: (x: 6, y: 2)))
        XCTAssertNil(canvas.pixel(at: (x: 3, y: 4)))
        XCTAssertNotNil(canvas.pixel(at: (x: 1, y: 2)))
    }
}

// MARK: - Test Helpers

private extension Canvas {
    func linesFromPPM(from startLine: Int, to endLine: Int, file: StaticString = #filePath, line: UInt = #line) -> [String]? {
        let lines = self.ppm.split(separator: "\n")
        guard endLine <= lines.count else {
            XCTFail("Requested endline (\(endLine)) not found in current line count (\(lines.count))", file: file, line: line)
            return nil
        }
        return lines[startLine - 1..<endLine].map(String.init)
    }
}