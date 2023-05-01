// Created on 30/04/23. Last modified in 2023.

public func translation(x: Double, y: Double, z: Double) -> Matrix4 {
    .translation(x: x, y: y, z: z)
}

public func scaling(x: Double, y: Double, z: Double) -> Matrix4 {
    .scaling(x: x, y: y, z: z)
}

public func rotationX(radians: Double) -> Matrix4 {
    .rotationX(radians: radians)
}

public func rotationY(radians: Double) -> Matrix4 {
    .rotationY(radians: radians)
}

public func rotationZ(radians: Double) -> Matrix4 {
    .rotationZ(radians: radians)
}

public func shearing(xy: Double, xz: Double, yx: Double, yz: Double, zx: Double, zy: Double) -> Matrix4 {
    .shearing(xy: xy, xz: xz, yx: yx, yz: yz, zx: zx, zy: zy)
}
