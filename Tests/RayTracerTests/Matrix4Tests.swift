//
// Created by Ángel Vázquez on 20/04/23.
//

import XCTest

struct Matrix4 {
    let e00: Double
    let e01: Double
    let e02: Double
    let e03: Double
    let e10: Double
    let e11: Double
    let e12: Double
    let e13: Double
    let e20: Double
    let e21: Double
    let e22: Double
    let e23: Double
    let e30: Double
    let e31: Double
    let e32: Double
    let e33: Double
}

class Matrix4Tests: XCTestCase {
    func test_init_creates4x4Matrix() {
        let matrix = Matrix4(
            e00: 1, e01: 2, e02: 3, e03: 4,
            e10: 5.5, e11: 6.5, e12: 7.5, e13: 8.5,
            e20: 9, e21: 10, e22: 11, e23: 12,
            e30: 13.5, e31: 14.5, e32: 15.5, e33: 16.5
        )

        XCTAssertEqual(matrix.e00, 1)
        XCTAssertEqual(matrix.e03, 4)
        XCTAssertEqual(matrix.e10, 5.5)
        XCTAssertEqual(matrix.e12, 7.5)
        XCTAssertEqual(matrix.e22, 11)
        XCTAssertEqual(matrix.e30, 13.5)
        XCTAssertEqual(matrix.e32, 15.5)
    }
}
