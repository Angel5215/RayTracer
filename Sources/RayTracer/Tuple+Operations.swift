//
// Created by Ángel Vázquez on 21/11/22.
//

extension Tuple {
    public func adding(_ tuple: Tuple) -> Tuple {
        guard !(isPoint && tuple.isPoint) else {
            preconditionFailure("Illegal operation. Both tuples can't be points simultaneously.")
        }
        return Tuple(
            x: x + tuple.x,
            y: y + tuple.y,
            z: z + tuple.z,
            w: w + tuple.w
        )
    }

    public func subtracting(_ tuple: Tuple) -> Tuple {
        guard !(isVector && tuple.isPoint) else {
            preconditionFailure("Illegal operation. Can't subtract point from vector.")
        }
        return Tuple(
            x: x - tuple.x,
            y: y - tuple.y,
            z: z - tuple.z,
            w: w - tuple.w
        )
    }
}