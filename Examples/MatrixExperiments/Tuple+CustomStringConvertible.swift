// Created on 30/04/23. Last modified in 2023.

import Foundation
import RayTracer

extension Tuple: CustomStringConvertible {
    public var description: String {
        """
        | \(format(x)) |
        | \(format(y)) |
        | \(format(z)) |
        | \(format(w)) |
        """
    }

    private func format(_ number: Double, using formatter: NumberFormatter = numberFormatter) -> String {
        numberFormatter.string(from: NSDecimalNumber(value: number))!
    }
}
