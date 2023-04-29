// Created on 28/04/23. Last modified in 2023.

import ArgumentParser
import Foundation
import RayTracer

// MARK: - Data structures

// Data input to be read from a JSON file.
struct DataInput: Decodable {
    let position: Tuple2D
    let velocity: Tuple2D
    let gravity: Tuple2D
    let wind: Tuple2D
    let speed: Double
}

// Represents a 2D tuple passed as an argument to this command
struct Tuple2D: Decodable {
    let x: Double
    let y: Double
}

// MARK: - Functions

// Represents the given projectile after one unit of time has passed
// The actual units of time doesn't matter, we'll call them ticks for this purpose
func tick(environment: Environment, projectile: Projectile) -> Projectile {
    Projectile(
        position: projectile.position + projectile.velocity,
        velocity: projectile.velocity + environment.gravity + environment.wind
    )
}

// Decode input JSON file
func loadData(from inputFile: URL) throws -> DataInput {
    let data = try Data(contentsOf: inputFile)
    return try JSONDecoder().decode(DataInput.self, from: data)
}

// Load projectile and environment information from parsed input file
func extractInformation(from dataInput: DataInput) -> (projectile: Projectile, environment: Environment) {
    let projectile = Projectile(
        position: point(
            x: dataInput.position.x,
            y: dataInput.position.y,
            z: 0
        ),
        velocity: dataInput.speed * vector(
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

// Calculations for projectile position
func positionsBeforeLanding(of projectile: Projectile, in environment: Environment) -> [Point] {
    var positions = [projectile.position]
    var projectile = projectile
    while projectile.position.y > 0 {
        projectile = tick(environment: environment, projectile: projectile)
        positions.append(projectile.position)
    }
    return positions
}
