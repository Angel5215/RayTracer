//
// Created by Ángel Vázquez on 21/11/22.
//

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
}