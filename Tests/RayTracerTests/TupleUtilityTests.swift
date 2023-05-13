// Created on 13/05/23. Last modified in 2023.

import RayTracer
import XCTest

class TupleUtilityTests: XCTestCase {
    func test_point_makesPointTuple() {
        let tuple = point(x: 2, y: 4, z: 9)

        XCTAssertEqual(tuple, .make(x: 2, y: 4, z: 9, w: 1))
        XCTAssertTrue(tuple.isPoint)
        XCTAssertFalse(tuple.isVector)
    }

    func test_vector_makesVectorTuple() {
        let tuple = vector(x: 2, y: 4, z: 9)

        XCTAssertEqual(tuple, .make(x: 2, y: 4, z: 9, w: 0))
        XCTAssertTrue(tuple.isVector)
        XCTAssertFalse(tuple.isPoint)
    }

    func test_make_makesAnyTuple() {
        let tuple = Tuple.make(x: 2, y: 4, z: 9, w: 9)

        XCTAssertEqual(tuple.x, 2)
        XCTAssertEqual(tuple.y, 4)
        XCTAssertEqual(tuple.z, 9)
        XCTAssertEqual(tuple.w, 9)
    }

    func test_color_makesColorTuple() {
        let tuple = color(red: -0.5, green: 0.4, blue: 1.7)

        XCTAssertEqual(tuple.red, -0.5)
        XCTAssertEqual(tuple.green, 0.4)
        XCTAssertEqual(tuple.blue, 1.7)
    }
}
