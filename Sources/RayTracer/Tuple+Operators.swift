//
// Created by Ángel Vázquez on 21/11/22.
//

public extension Tuple {
    static func +(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.adding(rhs)
    }

    static func -(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.subtracting(rhs)
    }

    static prefix func -(tuple: Tuple) -> Tuple {
        tuple.negated()
    }

    // MARK: - Multiplication by a scalar

    static func *(lhs: Tuple, rhs: Double) -> Tuple {
        lhs.multiplied(by: rhs)
    }

    static func *(lhs: Double, rhs: Tuple) -> Tuple {
        rhs.multiplied(by: lhs)
    }

    static func /(lhs: Tuple, rhs: Double) -> Tuple {
        lhs.divided(by: rhs)
    }

    static func .*(lhs: Tuple, rhs: Tuple) -> Double {
        lhs.dotProduct(with: rhs)
    }

    static func +*(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.crossProduct(with: rhs)
    }

    // MARK: - Color specific
    static func *(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.hadamardProduct(with: rhs)
    }
}
