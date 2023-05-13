// Created on 28/04/23. Last modified in 2023.

public extension Tuple {
    static func make(x: Double, y: Double, z: Double, w: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: w)
    }

    static func point(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 1)
    }

    static func vector(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 0)
    }

    static func color(red: Double, green: Double, blue: Double) -> Tuple {
        Tuple(x: red, y: green, z: blue, w: 0)
    }
}
