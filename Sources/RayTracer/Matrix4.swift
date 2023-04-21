//
// Created by Ángel Vázquez on 21/04/23.
//

public struct Matrix4: Equatable {
    private let dimension = 4
    private let rows: [[Double]]

    public init(rows: [[Double]]) {
        assert(isMatrixValid(for: dimension, rows: rows), "Matrix should have \(dimension * dimension) values.")
        self.rows = rows
    }

    public subscript(row: Int, column: Int) -> Double {
        get {
            rows[row][column]
        }
    }

    public func multiplying(_ matrix: Matrix4) -> Matrix4 {
        var newValues = [[Double]](repeating: [Double](repeating: 0, count: dimension), count: dimension)

        for row in 0..<dimension {
            for column in 0..<dimension {
                newValues[row][column] =
                    self[row, 0] * matrix[0, column] +
                    self[row, 1] * matrix[1, column] +
                    self[row, 2] * matrix[2, column] +
                    self[row, 3] * matrix[3, column]
            }
        }

        return Matrix4(rows: newValues)
    }
}
