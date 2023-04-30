// Created on 28/04/23. Last modified in 2023.

public struct Matrix4: Equatable {
    public static let identity = Matrix4(values: [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1])

    private let dimension = 4
    private let values: [Double]

    public init(values: [Double]) {
        assert(values.count == dimension * dimension, "Matrix should have \(dimension * dimension) values.")
        self.values = values
    }

    public subscript(row: Int, column: Int) -> Double {
        values[dimension * row + column]
    }

    public func multiplied(by matrix: Matrix4) -> Matrix4 {
        var newValues = [Double](repeating: 0, count: dimension * dimension)

        for row in 0..<dimension {
            for column in 0..<dimension {
                newValues[dimension * row + column] =
                    self[row, 0] * matrix[0, column] +
                    self[row, 1] * matrix[1, column] +
                    self[row, 2] * matrix[2, column] +
                    self[row, 3] * matrix[3, column]
            }
        }

        return Matrix4(values: newValues)
    }

    public func multiplied(by tuple: Tuple) -> Tuple {
        Tuple(
            x: self[0, 0] * tuple.x + self[0, 1] * tuple.y + self[0, 2] * tuple.z + self[0, 3] * tuple.w,
            y: self[1, 0] * tuple.x + self[1, 1] * tuple.y + self[1, 2] * tuple.z + self[1, 3] * tuple.w,
            z: self[2, 0] * tuple.x + self[2, 1] * tuple.y + self[2, 2] * tuple.z + self[2, 3] * tuple.w,
            w: self[3, 0] * tuple.x + self[3, 1] * tuple.y + self[3, 2] * tuple.z + self[3, 3] * tuple.w
        )
    }

    public func transposed() -> Matrix4 {
        Matrix4(values: [
            self[0, 0], self[1, 0], self[2, 0], self[3, 0],
            self[0, 1], self[1, 1], self[2, 1], self[3, 1],
            self[0, 2], self[1, 2], self[2, 2], self[3, 2],
            self[0, 3], self[1, 3], self[2, 3], self[3, 3]
        ])
    }

    public func submatrix(removingRow row: Int, andColumn column: Int) -> Matrix3 {
        var newValues = [Double]()

        for currentRow in 0..<dimension where currentRow != row {
            for currentColumn in 0..<dimension where currentColumn != column {
                newValues.append(self[currentRow, currentColumn])
            }
        }

        return Matrix3(values: newValues)
    }
}
