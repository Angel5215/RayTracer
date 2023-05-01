// Created on 30/04/23. Last modified in 2023.

import Foundation

public extension Matrix4 {
    static func translation(x: Double, y: Double, z: Double) -> Self {
        Matrix4(values: [
            1, 0, 0, x,
            0, 1, 0, y,
            0, 0, 1, z,
            0, 0, 0, 1
        ])
    }

    static func scaling(x: Double, y: Double, z: Double) -> Self {
        Matrix4(values: [
            x, 0, 0, 0,
            0, y, 0, 0,
            0, 0, z, 0,
            0, 0, 0, 1
        ])
    }

    static func rotationX(radians: Double) -> Self {
        let cos = cos(radians)
        let sin = sin(radians)

        return Matrix4(values: [
            1, 0, 0, 0,
            0, cos, -sin, 0,
            0, sin, cos, 0,
            0, 0, 0, 1
        ])
    }

    static func rotationY(radians: Double) -> Self {
        let cos = cos(radians)
        let sin = sin(radians)

        return Matrix4(values: [
            cos, 0, sin, 0,
            0, 1, 0, 0,
            -sin, 0, cos, 0,
            0, 0, 0, 1
        ])
    }

    static func rotationZ(radians: Double) -> Self {
        let cos = cos(radians)
        let sin = sin(radians)

        return Matrix4(values: [
            cos, -sin, 0, 0,
            sin, cos, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1
        ])
    }

    static func shearing(xy: Double, xz: Double, yx: Double, yz: Double, zx: Double, zy: Double) -> Self {
        Matrix4(values: [
            1, xy, xz, 0,
            yx, 1, yz, 0,
            zx, zy, 1, 0,
            0, 0, 0, 1
        ])
    }
}
