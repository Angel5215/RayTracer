//
// Created by Ángel Vázquez on 21/04/23.
//

func isMatrixValid(for dimension: Int, rows: [[Double]]) -> Bool {
    guard rows.count == dimension else { return false }
    return rows.allSatisfy { row in row.count == dimension }
}
