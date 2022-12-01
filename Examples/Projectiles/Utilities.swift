//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import Foundation
import RayTracer

// Data input to be read from a JSON file.
struct DataInput: Decodable {
    let position: Tuple2D
    let velocity: Tuple2D
    let gravity: Tuple2D
    let wind: Tuple2D
    let maximumFractionDigits: Int?
}

// Represents a 2D tuple passed as an argument to this command
struct Tuple2D: Decodable {
    let x: Double
    let y: Double
}

// Represents the given projectile after one unit of time has passed
// The actual units of time doesn't matter, we'll call them ticks for this purpose
func tick(environment: Environment, projectile: Projectile) -> Projectile {
    Projectile(
        position: projectile.position + projectile.velocity,
        velocity: projectile.velocity + environment.gravity + environment.wind
    )
}

