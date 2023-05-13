// Created on 13/05/23. Last modified in 2023.

import RayTracer
import XCTest

struct Ray {
    let origin: Point
    let direction: Vector

    func position(at distance: Double) -> Point {
        distance * direction + origin
    }

    func intersect(sphere: Sphere) -> [Double] {
        let sphereToRay = origin - sphere.origin
        let a = direction .* direction
        let b = 2 * direction .* sphereToRay
        let c = sphereToRay .* sphereToRay - 1
        let discriminant = b * b - 4 * a * c

        guard discriminant >= 0 else {
            return []
        }
        let firstSolution = (-b - sqrt(discriminant)) / (2 * a)
        let secondSolution = (-b + sqrt(discriminant)) / (2 * a)
        return [firstSolution, secondSolution]
    }
}

struct Sphere {
    let id = UUID()
    let origin = point(x: 0, y: 0, z: 0)
    let radius = 1.0
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

    func test_intersect_intersectionValuesForRayCrossingSphere() {
        let ray = Ray(origin: point(x: 0, y: 0, z: -5), direction: vector(x: 0, y: 0, z: 1))
        let sphere = Sphere()

        let intersections = ray.intersect(sphere: sphere)

        XCTAssertEqual(intersections, [4.0, 6.0])
    }

    func test_intersect_intersectionValuesForTangentRayWithSphere() {
        let ray = Ray(origin: point(x: 0, y: 1, z: -5), direction: vector(x: 0, y: 0, z: 1))
        let sphere = Sphere()

        let intersections = ray.intersect(sphere: sphere)

        XCTAssertEqual(intersections, [5.0, 5.0])
    }

    func test_intersect_emptyCollectionOfValuesForNoIntersectionWithSphere() {
        let ray = Ray(origin: point(x: 0, y: 2, z: -5), direction: vector(x: 0, y: 0, z: 1))
        let sphere = Sphere()

        let intersections = ray.intersect(sphere: sphere)

        XCTAssertTrue(intersections.isEmpty)
    }

    func test_intersect_intersectionValuesWhenRayOriginatesInsideSphere() {
        let ray = Ray(origin: point(x: 0, y: 0, z: 0), direction: vector(x: 0, y: 0, z: 1))
        let sphere = Sphere()

        let intersections = ray.intersect(sphere: sphere)

        XCTAssertEqual(intersections, [-1.0, 1.0])
    }

    func test_intersect_intersectionValuesWhenSphereIsBehindRay() {
        let ray = Ray(origin: point(x: 0, y: 0, z: 5), direction: vector(x: 0, y: 0, z: 1))
        let sphere = Sphere()

        let intersections = ray.intersect(sphere: sphere)

        XCTAssertEqual(intersections, [-6.0, -4.0])
    }
}
