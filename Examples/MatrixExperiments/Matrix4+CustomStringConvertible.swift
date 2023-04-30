// Created on 30/04/23. Last modified in 2023.

import Foundation
import RayTracer

extension Matrix4: CustomStringConvertible {
    public var description: String {
        """
        |\(format(self[0, 0])) \(format(self[0, 1])) \(format(self[0, 2])) \(format(self[0, 3])) |
        |\(format(self[1, 0])) \(format(self[1, 1])) \(format(self[1, 2])) \(format(self[1, 3])) |
        |\(format(self[2, 0])) \(format(self[2, 1])) \(format(self[2, 2])) \(format(self[2, 3])) |
        |\(format(self[3, 0])) \(format(self[3, 1])) \(format(self[3, 2])) \(format(self[3, 3])) |
        """
    }

    private func format(_ number: Double, using formatter: NumberFormatter = numberFormatter) -> String {
        numberFormatter.string(from: NSDecimalNumber(value: number))!
    }
}
