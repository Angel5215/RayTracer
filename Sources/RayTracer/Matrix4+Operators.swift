//
// Created by Ángel Vázquez on 21/04/23.
//

public extension Matrix4 {
    static func *(lhs: Matrix4, rhs: Matrix4) -> Matrix4 {
        lhs.multiplied(by: rhs)
    }

    static func *(lhs: Matrix4, rhs: Tuple) -> Tuple {
        lhs.multiplied(by: rhs)
    }
}
