// Created on 28/04/23. Last modified in 2023.

public extension Matrix4 {
    static func * (lhs: Matrix4, rhs: Matrix4) -> Matrix4 {
        lhs.multiplied(by: rhs)
    }

    static func * (lhs: Matrix4, rhs: Tuple) -> Tuple {
        lhs.multiplied(by: rhs)
    }
}
