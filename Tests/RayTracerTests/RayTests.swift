// Created on 13/05/23. Last modified in 2023.

import RayTracer
import XCTest

struct Ray {
    let origin: Point
    let direction: Vector

    func position(at distance: Double) -> Point {
        distance * direction + origin
    }
}

final class RayTests: XCTestCase {
    func test_init_initializesRayWithCorrectValues() {
        let ray = Ray(origin: point(x: 1, y: 2, z: 3), direction: vector(x: 4, y: 5, z: 6))

        XCTAssertEqual(ray.origin, point(x: 1, y: 2, z: 3))
        XCTAssertEqual(ray.direction, vector(x: 4, y: 5, z: 6))
    }

    func test_position_computesPointAtGivenDistance() {
        let ray = Ray(origin: point(x: 2, y: 3, z: 4), direction: vector(x: 1, y: 0, z: 0))

        XCTAssertEqual(ray.position(at: 0), point(x: 2, y: 3, z: 4))
        XCTAssertEqual(ray.position(at: 1), point(x: 3, y: 3, z: 4))
        XCTAssertEqual(ray.position(at: -1), point(x: 1, y: 3, z: 4))
        XCTAssertEqual(ray.position(at: 2.5), point(x: 4.5, y: 3, z: 4))
    }
}
