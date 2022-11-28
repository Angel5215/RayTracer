//
// Created by Ángel Vázquez on 27/11/22.
//

public typealias Point = Tuple
public typealias Vector = Tuple
public typealias Color = Tuple

public func point(x: Double, y: Double, z: Double) -> Point {
    Tuple.point(x: x, y: y, z: z)
}

public func vector(x: Double, y: Double, z: Double) -> Vector {
    Tuple.vector(x: x, y: y, z: z)
}

public func color(red: Double, green: Double, blue: Double) -> Color {
    Tuple.color(red: red, green: green, blue: blue)
}

public extension Color {
    static var black: Color { color(red: 0, green: 0, blue: 0) }
}