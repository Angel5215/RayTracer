// Created on 30/04/23. Last modified in 2023.

import Foundation
import RayTracer

extension Tuple: CustomStringConvertible {
    public var description: String {
        """
        |\t\(format(x))\t|
        |\t\(format(y))\t|
        |\t\(format(z))\t|
        |\t\(format(w))\t|
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
