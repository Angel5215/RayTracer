// Created on 30/04/23. Last modified in 2023.

import Foundation
import RayTracer

extension Matrix4: CustomStringConvertible {
    public var description: String {
        """
        |\t\(format(self[0, 0]))\t\(format(self[0, 1]))\t\(format(self[0, 2]))\t\(format(self[0, 3]))\t|
        |\t\(format(self[1, 0]))\t\(format(self[1, 1]))\t\(format(self[1, 2]))\t\(format(self[1, 3]))\t|
        |\t\(format(self[2, 0]))\t\(format(self[2, 1]))\t\(format(self[2, 2]))\t\(format(self[2, 3]))\t|
        |\t\(format(self[3, 0]))\t\(format(self[3, 1]))\t\(format(self[3, 2]))\t\(format(self[3, 3]))\t|
        """
    }

    private func format(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 5
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.positivePrefix = "+"
        return numberFormatter.string(from: NSDecimalNumber(value: number))!
    }
}
