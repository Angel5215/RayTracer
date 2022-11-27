//
// Created by Ángel Vázquez on 27/11/22.
//

public typealias Point = Tuple
public typealias Vector = Tuple

public func point(x: Double, y: Double, z: Double) -> Tuple {
    Tuple.point(x: x, y: y, z: z)
}

public func vector(x: Double, y: Double, z: Double) -> Tuple {
    Tuple.vector(x: x, y: y, z: z)
}
