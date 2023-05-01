// Created on 30/04/23. Last modified in 2023.

import RayTracer
import XCTest

final class MatrixTransformationsTests: XCTestCase {
    // MARK: - Translation

    func test_translationMatrix_multiplyingPointTranslatesPoint() {
        let transform = translation(x: 5, y: -3, z: 2)
        let initialPoint = point(x: -3, y: 4, z: 5)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 1, z: 7))
    }

    func test_translationMatrix_multiplyingInverseByPointTranslatesPointInReverse() {
        let transform = translation(x: 5, y: -3, z: 2)
        let initialPoint = point(x: -3, y: 4, z: 5)

        let result = transform.unsafeInverted() * initialPoint

        XCTAssertEqual(result, point(x: -8, y: 7, z: 3))
    }

    func test_translationMatrix_multiplyingVectorDoesNotAffectVector() {
        let transform = translation(x: 5, y: -3, z: 2)
        let initialVector = vector(x: -3, y: 4, z: 5)

        let result = transform * initialVector

        XCTAssertEqual(result, initialVector)
    }

    // MARK: - Scaling

    func test_scalingMatrix_multiplyingPointScalesThePoint() {
        let transform = scaling(x: 2, y: 3, z: 4)
        let initialPoint = point(x: -4, y: 6, z: 8)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: -8, y: 18, z: 32))
    }

    func test_scalingMatrix_multiplyingVectorScalesTheVector() {
        let transform = scaling(x: 2, y: 3, z: 4)
        let initialVector = vector(x: -4, y: 6, z: 8)

        let result = transform * initialVector

        XCTAssertEqual(result, vector(x: -8, y: 18, z: 32))
    }

    func test_scalingMatrix_multiplyingInverseByTupleScalesTupleInTheInverseWay() {
        let transform = scaling(x: 2, y: 3, z: 4)
        let initialVector = vector(x: -4, y: 6, z: 8)

        let result = transform.unsafeInverted() * initialVector

        XCTAssertEqual(result, vector(x: -2, y: 2, z: 2))
    }

    // MARK: - Rotation

    func test_rotationX_multiplyingTupleRotatesTupleAroundXAxis() {
        let initialPoint = point(x: 0, y: 1, z: 0)
        let halfQuarter = rotationX(radians: .pi / 4)
        let fullQuarter = rotationX(radians: .pi / 2)

        let result1 = halfQuarter * initialPoint
        let result2 = fullQuarter * initialPoint

        XCTAssertEqual(result1, point(x: 0, y: sqrt(2) / 2, z: sqrt(2) / 2))
        XCTAssertEqual(result2, point(x: 0, y: 0, z: 1))
    }

    func test_rotationX_multiplyingInverseWithTupleRotatesInOppositeDirection() {
        let initialPoint = point(x: 0, y: 1, z: 0)
        let halfQuarter = rotationX(radians: .pi / 4)
        let fullQuarter = rotationX(radians: .pi / 2)

        let result1 = halfQuarter.unsafeInverted() * initialPoint
        let result2 = fullQuarter.unsafeInverted() * initialPoint

        XCTAssertEqual(result1, point(x: 0, y: sqrt(2) / 2, z: -sqrt(2) / 2))
        XCTAssertEqual(result2, point(x: 0, y: 0, z: -1))
    }

    func test_rotationY_multiplyingTupleRotatesTupleAroundYAxis() {
        let initialPoint = point(x: 0, y: 0, z: 1)
        let halfQuarter = rotationY(radians: .pi / 4)
        let fullQuarter = rotationY(radians: .pi / 2)

        let result1 = halfQuarter * initialPoint
        let result2 = fullQuarter * initialPoint

        XCTAssertEqual(result1, point(x: sqrt(2) / 2, y: 0, z: sqrt(2) / 2))
        XCTAssertEqual(result2, point(x: 1, y: 0, z: 0))
    }

    func test_rotationZ_multiplyingTupleRotatesTupleAroundZAxis() {
        let initialPoint = point(x: 0, y: 1, z: 0)
        let halfQuarter = rotationZ(radians: .pi / 4)
        let fullQuarter = rotationZ(radians: .pi / 2)

        let result1 = halfQuarter * initialPoint
        let result2 = fullQuarter * initialPoint

        XCTAssertEqual(result1, point(x: -sqrt(2) / 2, y: sqrt(2) / 2, z: 0))
        XCTAssertEqual(result2, point(x: -1, y: 0, z: 0))
    }

    // MARK: - Shearing / Skew

    func test_shearing_multiplyingPointMovesXInProportionToY() {
        let transform = shearing(xy: 1, xz: 0, yx: 0, yz: 0, zx: 0, zy: 0)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 5, y: 3, z: 4))
    }

    func test_shearing_multiplyingPointMovesXInProportionToZ() {
        let transform = shearing(xy: 0, xz: 1, yx: 0, yz: 0, zx: 0, zy: 0)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 6, y: 3, z: 4))
    }

    func test_shearing_multiplyingPointMovesYInProportionToX() {
        let transform = shearing(xy: 0, xz: 0, yx: 1, yz: 0, zx: 0, zy: 0)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 5, z: 4))
    }

    func test_shearing_multiplyingPointMovesYInProportionToZ() {
        let transform = shearing(xy: 0, xz: 0, yx: 0, yz: 1, zx: 0, zy: 0)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 7, z: 4))
    }

    func test_shearing_multiplyingPointMovesZInProportionToX() {
        let transform = shearing(xy: 0, xz: 0, yx: 0, yz: 0, zx: 1, zy: 0)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 3, z: 6))
    }

    func test_shearing_multiplyingPointMovesZInProportionToY() {
        let transform = shearing(xy: 0, xz: 0, yx: 0, yz: 0, zx: 0, zy: 1)
        let initialPoint = point(x: 2, y: 3, z: 4)

        let result = transform * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 3, z: 7))
    }
}
