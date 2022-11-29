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

    init(width: Int, height: Int, fillColor: Color = .black) {
        self.width = width
        self.height = height
        self.pixels = [[Color]](repeating: [Color](repeating: fillColor, count: width), count: height)
    }

    mutating func writePixel(with color: Color, at position: Canvas.Position) {
        pixels[position.y][position.x] = color
    }

    func pixel(at position: Canvas.Position) -> Color {
        pixels[position.y][position.x]
    }

    var ppm: String {
        """
        P3
        \(width) \(height)
        255
        """
        .appending("\n")
        .appending(constructPixelData())
    }

    private func constructPixelData() -> String {
        var pixelData = [String]()
        for row in pixels {
            pixelData.append(row.map(string).joined(separator: " ").trimmingCharacters(in: .whitespaces))
        }
        return pixelData.flatMap(split).joined(separator: "\n")
    }

    private func string(from color: Color) -> String {
        let r = max(0, min(Int(round(color.x * 255)), 255))
        let g = max(0, min(Int(round(color.y * 255)), 255))
        let b = max(0, min(Int(round(color.z * 255)), 255))
        return "\(r) \(g) \(b)"
    }

    private func split(longLine: String) -> [String] {
        let offset = 70
        guard longLine.count > offset else { return [longLine] }
        let startIndex = longLine.startIndex
        let index = longLine.index(startIndex, offsetBy: offset)
        if longLine[index] == " " {
            return [longLine[startIndex..<index], longLine[index...]]
                        .map(String.init)
                        .map { $0.trimmingCharacters(in: .whitespaces) }
        } else {
            let spaceIndex = longLine[startIndex..<index].lastIndex { $0 == " " }!
            return [longLine[startIndex..<spaceIndex], longLine[spaceIndex...]]
                        .map(String.init)
                        .map { $0.trimmingCharacters(in: .whitespaces) }
        }
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
        var canvas = Canvas(width: 10, height: 2, fillColor: color(red: 1, green: 0.8, blue: 0.6))

        let ppmLines = canvas.linesFromPPM(from: 4, to: 7)

        XCTAssertEqual(ppmLines, [
            "255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204",
            "153 255 204 153 255 204 153 255 204 153 255 204 153",
            "255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204",
            "153 255 204 153 255 204 153 255 204 153 255 204 153"
        ])
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