//
// Created by Ángel Vázquez on 20/04/23.
//

import XCTest

struct Matrix: Equatable {
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

    func multiplying(_ matrix: Matrix) -> Matrix {
        var newValues = [[Double]](repeating: [Double](repeating: 0, count: dimension), count: dimension)

        for row in 0..<dimension {
            for column in 0..<dimension {
                newValues[row][column] = self[row, 0] * matrix[0, column] +
                    self[row, 1] * matrix[1, column] +
                    self[row, 2] * matrix[2, column] +
                    self[row, 3] * matrix[3, column]
            }
        }

        return Matrix(dimension: dimension, rows: newValues)
    }
}

class MatrixTests: XCTestCase {
    func test_init_creates4x4Matrix() {
        let matrix = Matrix(dimension: 4, rows: [[1, 2, 3, 4], [5.5, 6.5, 7.5, 8.5], [9, 10, 11, 12], [13.5, 14.5, 15.5, 16.5]])

        XCTAssertEqual(matrix[0, 0], 1)
        XCTAssertEqual(matrix[0, 1], 2)
        XCTAssertEqual(matrix[0, 2], 3)
        XCTAssertEqual(matrix[0, 3], 4)

        XCTAssertEqual(matrix[1, 0], 5.5)
        XCTAssertEqual(matrix[1, 1], 6.5)
        XCTAssertEqual(matrix[1, 2], 7.5)
        XCTAssertEqual(matrix[1, 3], 8.5)

        XCTAssertEqual(matrix[2, 0], 9)
        XCTAssertEqual(matrix[2, 1], 10)
        XCTAssertEqual(matrix[2, 2], 11)
        XCTAssertEqual(matrix[2, 3], 12)

        XCTAssertEqual(matrix[3, 0], 13.5)
        XCTAssertEqual(matrix[3, 1], 14.5)
        XCTAssertEqual(matrix[3, 2], 15.5)
        XCTAssertEqual(matrix[3, 3], 16.5)
    }

    func test_init_creates2x2Matrix() {
        let matrix = Matrix(dimension: 2, rows: [[-3, 5], [1, -2]])

        XCTAssertEqual(matrix[0, 0], -3)
        XCTAssertEqual(matrix[0, 1], 5)

        XCTAssertEqual(matrix[1, 0], 1)
        XCTAssertEqual(matrix[1, 1], -2)
    }

    func test_init_creates3x3Matrix() {
        let matrix = Matrix(dimension: 3, rows: [[-3, 5, 0], [1, -2, -7], [0, 1, 1]])

        XCTAssertEqual(matrix[0, 0], -3)
        XCTAssertEqual(matrix[0, 1], 5)
        XCTAssertEqual(matrix[0, 2], 0)

        XCTAssertEqual(matrix[1, 0], 1)
        XCTAssertEqual(matrix[1, 1], -2)
        XCTAssertEqual(matrix[1, 2], -7)

        XCTAssertEqual(matrix[2, 0], 0)
        XCTAssertEqual(matrix[2, 1], 1)
        XCTAssertEqual(matrix[2, 2], 1)
    }

    func test_equality_returnsTrueForIdenticalMatrices() {
        let firstMatrix = Matrix(dimension: 4, rows: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
        let secondMatrix = Matrix(dimension: 4, rows: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
        let thirdMatrix = Matrix(dimension: 4, rows: [[2, 3, 4, 5], [6, 7, 8, 9], [8, 7, 6, 5], [4, 3, 2, 1]])

        XCTAssertEqual(firstMatrix, secondMatrix)
        XCTAssertNotEqual(firstMatrix, thirdMatrix)
    }

    func test_multiplying_returnsNewMatrix() {
        let first = Matrix(dimension: 4, rows: [[1, 2, 3, 4], [5, 6, 7, 8], [9, 8, 7, 6], [5, 4, 3, 2]])
        let second = Matrix(dimension: 4, rows: [[-2, 1, 2, 3], [3, 2, 1, -1], [4, 3, 6, 5], [1, 2, 7, 8]])

        let result = first.multiplying(second)

        XCTAssertEqual(result, Matrix(dimension: 4, rows: [[20, 22, 50, 48], [44, 54, 114, 108], [40, 58, 110, 102], [16, 26, 46, 42]]))
    }
}
