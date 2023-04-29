// Created on 28/04/23. Last modified in 2023.

public struct Matrix2: Equatable {
    private let dimension = 2
    private let values: [Double]

    public var determinant: Double {
        self[0, 0] * self[1, 1] - self[1, 0] * self[0, 1]
    }

    public init(values: [Double]) {
        assert(values.count == dimension * dimension, "Matrix should have \(dimension * dimension) values.")
        self.values = values
    }

    public subscript(row: Int, column: Int) -> Double {
        values[dimension * row + column]
    }
}
