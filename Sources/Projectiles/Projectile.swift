//
// Created by Ángel Vázquez on 24/11/22.
//

import Foundation
import RayTracer

struct Projectile {
    let position: Point
    let velocity: Vector
}

extension Projectile: CustomStringConvertible {
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