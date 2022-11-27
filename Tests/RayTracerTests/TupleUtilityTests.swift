//
// Created by Ángel Vázquez on 27/11/22.
//

import RayTracer
import XCTest

class TupleUtilityTests: XCTestCase {
    func test_point_makesPointTuple() {
        let tuple = point(x: 2, y: 4, z: 9)

        XCTAssertEqual(tuple, Tuple(x: 2, y: 4, z: 9, w: 0))
        XCTAssertTrue(tuple.isPoint)
        XCTAssertFalse(tuple.isVector)
    }

    func test_vector_makesVectorTuple() {
        let tuple = vector(x: 2, y: 4, z: 9)

        XCTAssertEqual(tuple, Tuple(x: 2, y: 4, z: 9, w: 1))
        XCTAssertTrue(tuple.isVector)
        XCTAssertFalse(tuple.isPoint)
    }
}
