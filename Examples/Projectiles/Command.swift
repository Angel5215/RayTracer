//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import Foundation
import RayTracer

@main
struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility to simulate firing projectiles",
        version: "0.1.0",
        subcommands: [Calculate.self],
        defaultSubcommand: Calculate.self
    )
}

// MARK: - Options
struct Options: ParsableArguments {
    @Option(name: .customLong("input"), help: Help.inputFile, transform: URL.init(fileURLWithPath:))
    var inputFile: URL
}

struct Calculate: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Calculate values from firing a projectile.")

    @OptionGroup var options: Options

    @Option(name: .long, help: "Maximum fraction digits to display")
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