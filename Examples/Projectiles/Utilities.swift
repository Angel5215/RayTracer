//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import RayTracer

typealias Point = Tuple
typealias Vector = Tuple

let point = Tuple.point
let vector = Tuple.vector

// Represents a 2D tuple passed as an argument to this command
struct Tuple2D: ExpressibleByArgument {
    let x: Double
    let y: Double

    init?(argument: String) {
        let valueArray = argument
        .replacingOccurrences(of: "(", with: "")
        .replacingOccurrences(of: ")", with: "")
        .split(separator: ",")
        .compactMap(Double.init)
        guard valueArray.count == 2 else { return nil }
        self.x = valueArray[0]
        self.y = valueArray[1]
    }
}

// Represents the given projectile after one unit of time has passed
// The actual units of time doesn't matter, we'll call them ticks for this purpose
func tick(environment: Environment, projectile: Projectile) -> Projectile {
    Projectile(
        position: projectile.position + projectile.velocity,
        velocity: projectile.velocity + environment.gravity + environment.wind
    )
}

