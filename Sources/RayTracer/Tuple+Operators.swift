//
// Created by Ángel Vázquez on 21/11/22.
//

extension Tuple {
    public static func +(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.adding(rhs)
    }

    public static func -(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.subtracting(rhs)
    }

    public static prefix func -(tuple: Tuple) -> Tuple {
        tuple.negated()
    }

    // MARK: - Multiplication by a scalar

    public static func *(lhs: Tuple, rhs: Double) -> Tuple {
        lhs.multiplied(by: rhs)
    }

    public static func *(lhs: Double, rhs: Tuple) -> Tuple {
        rhs.multiplied(by: lhs)
    }

    public static func /(lhs: Tuple, rhs: Double) -> Tuple {
        lhs.divided(by: rhs)
    }

    public static func •(lhs: Tuple, rhs: Tuple) -> Double {
        lhs.dotProduct(with: rhs)
    }

    public static func ⨯(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.crossProduct(with: rhs)
    }
}