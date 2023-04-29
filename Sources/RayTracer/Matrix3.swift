// Created on 28/04/23. Last modified in 2023.

public struct Matrix3: Equatable {
    private let dimension = 3
    private let values: [Double]

    public init(values: [Double]) {
        assert(values.count == dimension * dimension, "Matrix should have \(dimension * dimension) values.")
        self.values = values
    }

    public subscript(row: Int, column: Int) -> Double {
        values[dimension * row + column]
    }
}
