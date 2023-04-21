//
// Created by Ángel Vázquez on 20/04/23.
//

import XCTest

struct Matrix {
    private let dimension: Int
    private let rows: [[Double]]

    init(dimension: Int, rows: [[Double]]) {
        guard Matrix.isValid(for: dimension, rows: rows) else {
            preconditionFailure("Matrix should have \(dimension * dimension) values.")
        }
        self.dimension = dimension
        self.rows = rows
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            rows[row][column]
        }
    }

    private static func isValid(for dimension: Int, rows: [[Double]]) -> Bool {
        guard rows.count == dimension else { return false }
        return rows.allSatisfy { row in row.count == dimension }
    }
}

class Matrix4Tests: XCTestCase {
    func test_init_creates4x4Matrix() {
        let matrix = Matrix(dimension: 4, rows: [[1, 2, 3, 4], [5.5, 6.5, 7.5, 8.5], [9, 10, 11, 12], [13.5, 14.5, 15.5, 16.5]])

        XCTAssertEqual(matrix[0, 0], 1)
        XCTAssertEqual(matrix[0, 3], 4)
        XCTAssertEqual(matrix[1, 0], 5.5)
        XCTAssertEqual(matrix[1, 2], 7.5)
        XCTAssertEqual(matrix[2, 2], 11)
        XCTAssertEqual(matrix[3, 0], 13.5)
        XCTAssertEqual(matrix[3, 2], 15.5)
    }
}
