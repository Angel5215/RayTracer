// Created on 28/04/23. Last modified in 2023.

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
        pixels = [[Color]](repeating: [Color](repeating: fillColor, count: width), count: height)
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
        @Constrained(minimum: 0, maximum: 255) var r = Int(round(color.red * 255))
        @Constrained(minimum: 0, maximum: 255) var g = Int(round(color.green * 255))
        @Constrained(minimum: 0, maximum: 255) var b = Int(round(color.blue * 255))
        return "\(r) \(g) \(b)"
    }

    private func split(line: String) -> [String] {
        let maxLineLength = 70
        guard line.count > maxLineLength else { return [line] }

        var newLines = [String]()
        var remainingLine = line

        while remainingLine.count > maxLineLength {
            let startIndex = remainingLine.startIndex
            let maxLengthIndex = remainingLine.index(startIndex, offsetBy: maxLineLength - 1)

            let space: Character = " "
            let lastSpaceIndex = remainingLine[startIndex...maxLengthIndex].lastIndex(of: space)!

            newLines.append(String(remainingLine[startIndex..<lastSpaceIndex]).trimmingCharacters(in: .whitespaces))
            remainingLine = String(remainingLine[lastSpaceIndex...]).trimmingCharacters(in: .whitespaces)
        }

        if remainingLine != "" {
            newLines.append(remainingLine.trimmingCharacters(in: .whitespaces))
        }

        return newLines
    }
}
