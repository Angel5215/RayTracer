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
}