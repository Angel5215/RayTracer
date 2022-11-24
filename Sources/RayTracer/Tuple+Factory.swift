//
// Created by Ángel Vázquez on 21/11/22.
//

public extension Tuple {
    static func point(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 1)
    }

    static func vector(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 0)
    }
}