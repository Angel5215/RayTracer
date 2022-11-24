//
// Created by Ángel Vázquez on 24/11/22.
//

import Foundation
import RayTracer

typealias Point = Tuple
typealias Vector = Tuple

let point = Tuple.point
let vector = Tuple.vector

struct Projectile: CustomStringConvertible {
    let position: Point
    let velocity: Vector

    private static let formatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        return formatter
    }()

    var description: String {
        """
        (x: \(Self.formatter.string(from: NSNumber(value: position.x))!), \
        y: \(Self.formatter.string(from: NSNumber(value: position.y))!))
        """
    }
}

struct Environment {
    let gravity: Vector
    let wind: Vector
}