//
// Created by Ángel Vázquez on 21/04/23.
//


public struct Matrix2: Equatable {
    private let dimension = 2
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
}
