// Created on 28/04/23. Last modified in 2023.

import RayTracer
import XCTest

class MatrixTests: XCTestCase {
    func test_init_creates4x4Matrix() {
        let matrix = Matrix4(values: [1, 2, 3, 4, 5.5, 6.5, 7.5, 8.5, 9, 10, 11, 12, 13.5, 14.5, 15.5, 16.5])

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
        let matrix = Matrix2(values: [-3, 5, 1, -2])

        XCTAssertEqual(matrix[0, 0], -3)
        XCTAssertEqual(matrix[0, 1], 5)

        XCTAssertEqual(matrix[1, 0], 1)
        XCTAssertEqual(matrix[1, 1], -2)
    }

    func test_init_creates3x3Matrix() {
        let matrix = Matrix3(values: [-3, 5, 0, 1, -2, -7, 0, 1, 1])

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
        let firstMatrix = Matrix4(values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2])
        let secondMatrix = Matrix4(values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2])
        let thirdMatrix = Matrix4(values: [2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1])

        XCTAssertEqual(firstMatrix, secondMatrix)
        XCTAssertNotEqual(firstMatrix, thirdMatrix)
    }

    func test_multipliedByMatrix_returnsNewMatrix() {
        let first = Matrix4(values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2])
        let second = Matrix4(values: [-2, 1, 2, 3, 3, 2, 1, -1, 4, 3, 6, 5, 1, 2, 7, 8])

        let result = first.multiplied(by: second)

        XCTAssertEqual(result, Matrix4(values: [20, 22, 50, 48, 44, 54, 114, 108, 40, 58, 110, 102, 16, 26, 46, 42]))
    }

    func test_multipliedByTuple_returnsNewTuple() {
        let matrix = Matrix4(values: [1, 2, 3, 4, 2, 4, 4, 2, 8, 6, 4, 1, 0, 0, 0, 1])
        let tuple = Tuple(x: 1, y: 2, z: 3, w: 1)

        let result = matrix.multiplied(by: tuple)

        XCTAssertEqual(result, Tuple(x: 18, y: 24, z: 33, w: 1))
    }

    func test_multipliedByIdentityMatrix_returnsSameMatrix() {
        let matrix = Matrix4(values: [0, 1, 2, 4, 1, 2, 4, 8, 2, 4, 8, 16, 4, 8, 16, 32])

        let result = matrix * Matrix4.identity
        let result2 = Matrix4.identity * matrix

        XCTAssertEqual(result, matrix)
        XCTAssertEqual(result2, matrix)
    }

    func test_identityMultipliedByTuple_returnsTheSameTuple() {
        let identity = Matrix4.identity
        let tuple = Tuple(x: 1, y: 2, z: 3, w: 4)

        let result = identity * tuple

        XCTAssertEqual(result, tuple)
    }

    func test_transposed_transformsRowsIntoColumnsAndColumnsIntoRows() {
        let matrix = Matrix4(values: [0, 9, 3, 0, 9, 8, 0, 8, 1, 8, 5, 3, 0, 0, 5, 8])

        let transposed = matrix.transposed()

        XCTAssertEqual(transposed, Matrix4(values: [0, 9, 1, 0, 9, 8, 8, 0, 3, 0, 5, 5, 0, 8, 3, 8]))
    }

    func test_transposed_forIdentityMatrixReturnsIdentityMatrix() {
        let identity = Matrix4.identity

        let transposed = identity.transposed()

        XCTAssertEqual(transposed, Matrix4.identity)
    }

    func test_determinant_calculatesCorrectlyFor2x2Matrices() {
        let matrix = Matrix2(values: [1, 5, -3, 2])

        let determinant = matrix.determinant

        XCTAssertEqual(determinant, 17)
    }

    func test_submatrix_for3x3MatricesReturn2x2Matrices() {
        let rowColumnPairs: [(row: Int, column: Int)] = [
            (0, 0), (0, 1), (0, 2),
            (1, 0), (1, 1), (1, 2),
            (2, 0), (2, 1), (2, 2)
        ]

        let expectedSolutions = [
            Matrix2(values: [2, 7, 6, -3]), Matrix2(values: [-3, 7, 0, -3]), Matrix2(values: [-3, 2, 0, 6]),
            Matrix2(values: [5, 0, 6, -3]), Matrix2(values: [1, 0, 0, -3]), Matrix2(values: [1, 5, 0, 6]),
            Matrix2(values: [5, 0, 2, 7]), Matrix2(values: [1, 0, -3, 7]), Matrix2(values: [1, 5, -3, 2])
        ]

        for (sample, submatrix) in zip(rowColumnPairs, expectedSolutions) {
            let matrix = Matrix3(values: [1, 5, 0, -3, 2, 7, 0, 6, -3])

            let result = matrix.submatrix(removingRow: sample.row, andColumn: sample.column)

            XCTAssertEqual(result, submatrix)
        }
    }

    // MARK: - Tests with operators

    func test_multipliedByMatrixWithOperator_returnsNewMatrix() {
        let first = Matrix4(values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2])
        let second = Matrix4(values: [-2, 1, 2, 3, 3, 2, 1, -1, 4, 3, 6, 5, 1, 2, 7, 8])

        let result = first * second

        XCTAssertEqual(result, Matrix4(values: [20, 22, 50, 48, 44, 54, 114, 108, 40, 58, 110, 102, 16, 26, 46, 42]))
    }

    func test_multipliedByTupleWithOperator_returnsNewTuple() {
        let matrix = Matrix4(values: [1, 2, 3, 4, 2, 4, 4, 2, 8, 6, 4, 1, 0, 0, 0, 1])
        let tuple = Tuple(x: 1, y: 2, z: 3, w: 1)

        let result = matrix * tuple

        XCTAssertEqual(result, Tuple(x: 18, y: 24, z: 33, w: 1))
    }
}
