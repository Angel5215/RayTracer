//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import Foundation
import RayTracer

@main
struct Command: ParsableCommand {
    @Option(
        name: .customLong("input"),
        help: Help.inputFile,
        transform: URL.init(fileURLWithPath:)
    )
    private var inputFile: URL

    func run() throws {
        let data = try Data(contentsOf: inputFile)
        let decoder = JSONDecoder()
        let information = try decoder.decode(DataInput.self, from: data)

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = information.maximumFractionDigits ?? 4

        var projectile = Projectile(
            position: point(
                x: information.position.x,
                y: information.position.y,
                z: 0
            ),
            velocity: vector(
                x: information.velocity.x,
                y: information.velocity.y,
                z: 0
            ).normalized()
        )

        let environment = Environment(
            gravity: vector(
                x: information.gravity.x,
                y: information.gravity.y,
                z: 0
            ),
            wind: vector(
                x: information.wind.x,
                y: information.wind.y,
                z: 0
            )
        )

        reportStatus(of: projectile, using: formatter)
        while projectile.position.y > 0 {
            projectile = tick(environment: environment, projectile: projectile)
            reportStatus(of: projectile, using: formatter)
        }
    }
}

// MARK: - Helpers

extension Command {
    private func reportStatus(of projectile: Projectile, using formatter: NumberFormatter) {
        let x = formatter.string(from: NSNumber(value: projectile.position.x))!
        let y = formatter.string(from: NSNumber(value: projectile.position.y))!
        print("Position:", "(\(x), \(y))")
    }
}

