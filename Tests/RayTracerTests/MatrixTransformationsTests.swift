// Created on 30/04/23. Last modified in 2023.

import RayTracer
import XCTest

final class MatrixTransformationsTests: XCTestCase {
    func test_translationMatrix_multiplyingPointTranslatesPoint() {
        let translationMatrix = translation(x: 5, y: -3, z: 2)
        let initialPoint = point(x: -3, y: 4, z: 5)

        let result = translationMatrix * initialPoint

        XCTAssertEqual(result, point(x: 2, y: 1, z: 7))
    }

    func test_translationMatrix_multiplyingInverseByPointTranslatesPointInReverse() {
        let translationMatrix = translation(x: 5, y: -3, z: 2)
        let initialPoint = point(x: -3, y: 4, z: 5)

        let result = translationMatrix.inverted()! * initialPoint

        XCTAssertEqual(result, point(x: -8, y: 7, z: 3))
    }

    func test_translationMatrix_multiplyingVectorDoesNotAffectVector() {
        let translationMatrix = translation(x: 5, y: -3, z: 2)
        let initialVector = vector(x: -3, y: 4, z: 5)

        let result = translationMatrix * initialVector

        XCTAssertEqual(result, initialVector)
    }
}
