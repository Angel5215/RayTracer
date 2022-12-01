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

enum Helper {
    static func loadData(from inputFile: URL) throws -> DataInput {
        let data = try Data(contentsOf: inputFile)
        return try JSONDecoder().decode(DataInput.self, from: data)
    }

    static func extractInformation(from dataInput: DataInput) -> (projectile: Projectile, environment: Environment) {
        let projectile = Projectile(
            position: point(
                x: dataInput.position.x,
                y: dataInput.position.y,
                z: 0
            ),
            velocity: vector(
                x: dataInput.velocity.x,
                y: dataInput.velocity.y,
                z: 0
            ).normalized()
        )

        let environment = Environment(
            gravity: vector(
                x: dataInput.gravity.x,
                y: dataInput.gravity.y,
                z: 0
            ),
            wind: vector(
                x: dataInput.wind.x,
                y: dataInput.wind.y,
                z: 0
            )
        )

        return (projectile, environment)
    }

    static func positionsBeforeLanding(of projectile: Projectile, in environment: Environment) -> [Point] {
        var positions = [projectile.position]
        var projectile = projectile
        while projectile.position.y > 0 {
            projectile = tick(environment: environment, projectile: projectile)
            positions.append(projectile.position)
        }
        return positions
    }
}

struct Calculate: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Calculate values from firing a projectile.")

    @OptionGroup var options: Options

    @Option(name: .long, help: "Maximum fraction digits to display")
    var maximumFractionDigits = 4

    func run() throws {
        let dataInput = try Helper.loadData(from: options.inputFile)
        let (projectile, environment) = Helper.extractInformation(from: dataInput)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maximumFractionDigits

        let positions = Helper.positionsBeforeLanding(of: projectile, in: environment)
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