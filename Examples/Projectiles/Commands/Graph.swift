// Created on 28/04/23. Last modified in 2023.

import ArgumentParser
import Foundation
import RayTracer

struct Graph: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Calculate values from firing a projectile.")

    @OptionGroup var options: Options

    @Option(name: .long, help: Help.width)
    var width: Int

    @Option(name: .long, help: Help.height)
    var height: Int

    @Option(name: .customLong("output"), help: Help.maximumFractionDigits)
    var outputPath = "projectile.ppm"

    func run() throws {
        let dataInput = try loadData(from: options.inputFile)
        let (projectile, environment) = extractInformation(from: dataInput)

        let points = positionsBeforeLanding(of: projectile, in: environment)
        var canvas = Canvas(width: width, height: height)
        let canvasCoordinates = points.map(canvasCoordinate(in: canvas))

        for coordinate in canvasCoordinates {
            canvas.writePixel(
                with: color(red: 1, green: 0, blue: 1),
                at: (x: coordinate.x, y: coordinate.y)
            )
        }

        let url = URL(fileURLWithPath: outputPath)
        let data = Data(canvas.ppm.utf8)
        try data.write(to: url, options: .atomic)
    }

    private func canvasCoordinate(from point: Point, in canvas: Canvas) -> Canvas.Position {
        Canvas.Position(x: Int(point.x), y: canvas.height - Int(point.y))
    }

    private func canvasCoordinate(in canvas: Canvas) -> (_ point: Point) -> Canvas.Position {
        { point in canvasCoordinate(from: point, in: canvas) }
    }
}
