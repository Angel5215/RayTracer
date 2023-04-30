// Created on 29/04/23. Last modified in 2023.

extension Matrix4: Equatable {
    public static func == (lhs: Matrix4, rhs: Matrix4) -> Bool {
        zip(lhs.values, rhs.values).allSatisfy { lhs, rhs in isAlmostEqual(lhs: lhs, rhs: rhs) }
    }

    private static func isAlmostEqual(lhs: Double, rhs: Double, epsilon: Double = 1e-5) -> Bool {
        abs(lhs - rhs) < epsilon
    }
}
