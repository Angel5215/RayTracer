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

    public func submatrix(removingRow row: Int, andColumn column: Int) -> Matrix2 {
        var newValues = [Double]()

        for currentRow in 0..<dimension where currentRow != row {
            for currentColumn in 0..<dimension where currentColumn != column {
                newValues.append(self[currentRow, currentColumn])
            }
        }

        return Matrix2(values: newValues)
    }

    public func minor(forRow row: Int, andColumn column: Int) -> Double {
        submatrix(removingRow: row, andColumn: column).determinant
    }

    public func cofactor(forRow row: Int, andColumn column: Int) -> Double {
        let sign = (row + column).isMultiple(of: 2) ? 1.0 : -1.0
        return sign * minor(forRow: row, andColumn: column)
    }
}
