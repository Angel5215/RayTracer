//
// Created by Ángel Vázquez on 21/04/23.
//

public struct Matrix3: Equatable {
    private let dimension = 3
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
}
