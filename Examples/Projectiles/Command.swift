//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import Foundation
import RayTracer

@main
struct Command: ParsableCommand {
    @Option(name: .shortAndLong, help: Help.position)
    private var position: Tuple2D

    @Option(name: .shortAndLong, help: Help.velocity)
    private var velocity: Tuple2D

    @Option(name: .shortAndLong, help: Help.gravity)
    private var gravity: Tuple2D

    @Option(name: .shortAndLong, help: Help.wind)
    private var wind: Tuple2D

    @Option(name: .long, help: Help.maximumFractionDigits)
    private var maximumFractionDigits: Int = 4

    func run() throws {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = maximumFractionDigits

        var projectile = Projectile(
            position: point(x: position.x, y: position.y, z: 0),
            velocity: vector(x: velocity.x, y: velocity.y, z: 0).normalized()
        )

        let environment = Environment(
            gravity: vector(x: gravity.x, y: gravity.y, z: 0),
            wind: vector(x: wind.x, y: wind.y, z: 0)
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

