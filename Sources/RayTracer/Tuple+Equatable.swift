//
// Created by Ángel Vázquez on 22/11/22.
//

extension Tuple: Equatable {
    public static func ==(lhs: Tuple, rhs: Tuple) -> Bool {
        let isXEqual = isAlmostEqual(lhs: lhs.x, rhs: rhs.x)
        let isYEqual = isAlmostEqual(lhs: lhs.y, rhs: rhs.y)
        let isZEqual = isAlmostEqual(lhs: lhs.z, rhs: rhs.z)
        return isXEqual && isYEqual && isZEqual
    }

    private static func isAlmostEqual(lhs: Double, rhs: Double, epsilon: Double = 1e-6) -> Bool {
        abs(lhs - rhs) < epsilon
    }
}