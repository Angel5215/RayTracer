// Created on 01/05/23. Last modified in 2023.

import ArgumentParser
import Foundation
import RayTracer

@main
struct PaintClock: ParsableCommand {
    @Option(name: .long, help: "Size for the square canvas to be drawn in pixels.")
    var canvasSize = 30

    @Option(name: .customLong("output"), help: "Name for output .ppm file to be produced.")
    var outputPath = "clock.ppm"

    var clockRadius: Double { Double(canvasSize) * 3 / 8 }

    func run() throws {
        var canvas = Canvas(width: canvasSize, height: canvasSize)
        let canvasCenter = Canvas.Position(x: canvasSize / 2, y: canvasSize / 2)

        let originPoint = point(x: 0, y: 0, z: 1)

        calculateClockPoints(startingAt: originPoint)
            .map { point in canvasCoordinate(from: point, in: canvas, relativeTo: canvasCenter) }
            .forEach { position in canvas.writePixel(with: color(red: 1, green: 1, blue: 0), at: position) }

        let url = URL(fileURLWithPath: outputPath)
        let data = Data(canvas.ppm.utf8)
        try data.write(to: url, options: .atomic)
    }

    private func calculateClockPoints(startingAt origin: Point) -> [Point] {
        var points = [Point]()
        for angle in stride(from: 0, to: 2.0 * .pi, by: .pi / 6) {
            let transform = rotationY(radians: angle) >>> scaling(x: clockRadius, y: clockRadius, z: clockRadius)
            let currentPoint = transform * origin
            points.append(currentPoint)
        }
        return points
    }

    // MARK: - Canvas Coordinates

    private func canvasCoordinate(from point: Point, in canvas: Canvas, relativeTo canvasPosition: Canvas.Position) -> Canvas.Position {
        Canvas.Position(x: canvasPosition.x + Int(point.x), y: canvasPosition.y - Int(point.z))
    }
}
