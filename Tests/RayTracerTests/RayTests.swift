// Created on 13/05/23. Last modified in 2023.

import RayTracer
import XCTest

struct Ray {
    let origin: Point
    let direction: Vector
}

final class RayTests: XCTestCase {
    func test_init_initializesRayWithCorrectValues() {
        let ray = Ray(origin: point(x: 1, y: 2, z: 3), direction: vector(x: 4, y: 5, z: 6))

        XCTAssertEqual(ray.origin, point(x: 1, y: 2, z: 3))
        XCTAssertEqual(ray.direction, vector(x: 4, y: 5, z: 6))
    }
}
