//
// Created by Ángel Vázquez on 21/04/23.
//

public struct Matrix4: Equatable {
    private let dimension = 4
    private let values: [Double]

    public init(values: [Double]) {
        assert(values.count == dimension * dimension, "Matrix should have \(dimension * dimension) values.")
        self.values = values
    }

    public subscript(row: Int, column: Int) -> Double {
        get {
            values[dimension * row + column]
        }
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
}
