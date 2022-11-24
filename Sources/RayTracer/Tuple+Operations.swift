//
// Created by Ángel Vázquez on 21/11/22.
//
import Foundation

extension Tuple {
    public func adding(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x + tuple.x,
            y: y + tuple.y,
            z: z + tuple.z,
            w: w + tuple.w
        )
    }

    public func subtracting(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x - tuple.x,
            y: y - tuple.y,
            z: z - tuple.z,
            w: w - tuple.w
        )
    }

    public func negated() -> Tuple {
        Tuple(x: -x, y: -y, z: -z, w: -w)
    }

    public func multiplied(by scalar: Double) -> Tuple {
        Tuple(
            x: x * scalar,
            y: y * scalar,
            z: z * scalar,
            w: w * scalar
        )
    }

    public func divided(by scalar: Double) -> Tuple {
        multiplied(by: 1 / scalar)
    }

    public var magnitude: Double {
        (x * x + y * y + z * z + w * w).squareRoot()
    }

    public func normalized() -> Tuple {
        self / magnitude
    }

    public func dotProduct(with tuple: Tuple) -> Double {
        x * tuple.x + y * tuple.y + z * tuple.z + w * tuple.z
    }
}