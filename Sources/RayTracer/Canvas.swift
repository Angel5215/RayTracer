//
// Created by Ángel Vázquez on 29/11/22.
//

import Foundation

public struct Canvas {
    // MARK: - Properties

    public let width: Int
    public let height: Int
    private var pixels: [[Color]]

    public var ppm: String {
        """
        P3
        \(width) \(height)
        255
        \(constructPixelData())
        """
        .appending("\n")
    }

    // MARK: - Initializers

    public typealias Position = (x: Int, y: Int)

    public init(width: Int, height: Int, fillColor: Color = .black) {
        self.width = width
        self.height = height
        self.pixels = [[Color]](repeating: [Color](repeating: fillColor, count: width), count: height)
    }

    // MARK: - Methods

    public mutating func writePixel(with color: Color, at position: Canvas.Position) {
        guard position.x >= 0, position.y >= 0, position.x < width, position.y < height else { return }
        pixels[position.y][position.x] = color
    }

    public func pixel(at position: Canvas.Position) -> Color? {
        guard position.x >= 0, position.y >= 0, position.x < width, position.y < height else { return nil }
        return pixels[position.y][position.x]
    }

    // MARK: - PPM generation

    private func constructPixelData() -> String {
        var pixelData = [String]()
        for row in pixels {
            pixelData.append(row.map(string).joined(separator: " ").trimmingCharacters(in: .whitespaces))
        }
        return pixelData.flatMap(split).joined(separator: "\n")
    }

    private func string(from color: Color) -> String {
        let r = constrain(value: Int(round(color.x * 255)), between: 0, and: 255)
        let g = constrain(value: Int(round(color.y * 255)), between: 0, and: 255)
        let b = constrain(value: Int(round(color.z * 255)), between: 0, and: 255)
        return "\(r) \(g) \(b)"
    }

    private func constrain(value: Int, between minimum: Int, and maximum: Int) -> Int {
        max(minimum, min(value, maximum))
    }

    private func split(longLine: String) -> [String] {
        let offset = 70
        guard longLine.count > offset else { return [longLine] }
        let startIndex = longLine.startIndex
        let index = longLine.index(startIndex, offsetBy: offset)
        let space: Character = " "
        let newLines: [Substring]

        if longLine[index] == space {
            newLines = [longLine[startIndex..<index], longLine[index...]]
        } else {
            // Substring is guaranteed to have at least one space
            let spaceIndex = longLine[startIndex..<index].lastIndex { $0 == space }!
            newLines = [longLine[startIndex..<spaceIndex], longLine[spaceIndex...]]
        }
        return newLines.map(String.init).map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
