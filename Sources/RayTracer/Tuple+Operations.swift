// Created on 28/04/23. Last modified in 2023.

//
// Created by Ángel Vázquez on 21/11/22.
//
import Foundation

public extension Tuple {
    func adding(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x + tuple.x,
            y: y + tuple.y,
            z: z + tuple.z,
            w: w + tuple.w
        )
    }

    func subtracting(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x - tuple.x,
            y: y - tuple.y,
            z: z - tuple.z,
            w: w - tuple.w
        )
    }

    func negated() -> Tuple {
        Tuple(x: -x, y: -y, z: -z, w: -w)
    }

    func multiplied(by scalar: Double) -> Tuple {
        Tuple(
            x: x * scalar,
            y: y * scalar,
            z: z * scalar,
            w: w * scalar
        )
    }

    func divided(by scalar: Double) -> Tuple {
        multiplied(by: 1 / scalar)
    }

    var magnitude: Double {
        (x * x + y * y + z * z + w * w).squareRoot()
    }

    func normalized() -> Tuple {
        self / magnitude
    }

    func dotProduct(with tuple: Tuple) -> Double {
        x * tuple.x + y * tuple.y + z * tuple.z + w * tuple.z
    }

    func crossProduct(with tuple: Tuple) -> Tuple {
        Tuple.vector(
            x: y * tuple.z - z * tuple.y,
            y: z * tuple.x - x * tuple.z,
            z: x * tuple.y - y * tuple.x
        )
    }

    // MARK: - Color specific

    /// Also known as Schur product.
    ///
    /// - Parameter tuple: The tuple to multiply with this one.
    /// - Returns: A new tuple multiplying corresponding components of this tuple to form the new tuple.
    func hadamardProduct(with tuple: Tuple) -> Tuple {
        Tuple(
            x: x * tuple.x,
            y: y * tuple.y,
            z: z * tuple.z,
            w: w * tuple.w
        )
    }
}
