//
// Created by Ángel Vázquez on 24/11/22.
//

import RayTracer

// Represents the given projectile after one unit of time has passed
// The actual units of time doesn't matter, we'll call them ticks for this purpose
func tick(environment: Environment, projectile: Projectile) -> Projectile {
    Projectile(
        position: projectile.position + projectile.velocity,
        velocity: projectile.velocity + environment.gravity + environment.wind
    )
}

var projectile = Projectile(
    position: point(0, 1, 0),
    velocity: vector(1, 1, 0).normalized()
)

let environment = Environment(
    gravity: vector(0, -0.1, 0),
    wind: vector(-0.01, 0, 0)
)

var hasProjectileLanded = false

print("Position:", projectile)
repeat {
    projectile = tick(environment: environment, projectile: projectile)
    hasProjectileLanded = projectile.position.y <= 0
    print("Position:", projectile)
} while !hasProjectileLanded