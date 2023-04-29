// Created on 28/04/23. Last modified in 2023.

import ArgumentParser
import Foundation
import RayTracer

struct Calculate: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Calculate values from firing a projectile.")

    @OptionGroup var options: Options

    @Option(name: .long, help: Help.maximumFractionDigits)
    var maximumFractionDigits = 4

    func run() throws {
        let dataInput = try loadData(from: options.inputFile)
        let (projectile, environment) = extractInformation(from: dataInput)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maximumFractionDigits

        let positions = positionsBeforeLanding(of: projectile, in: environment)
        for (index, point) in zip(positions.indices, positions) {
            let formattedPoint = format(point: point, using: formatter)
            print(index + 1, formattedPoint, separator: ". ")
        }
    }

    private func format(point: Point, using formatter: NumberFormatter) -> String {
        let x = formatter.string(from: NSNumber(value: point.x))!
        let y = formatter.string(from: NSNumber(value: point.y))!
        return "(\(x), \(y))"
    }
}
