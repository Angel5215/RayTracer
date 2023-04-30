// Created on 30/04/23. Last modified in 2023.

import Foundation

let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 3
    numberFormatter.maximumFractionDigits = 3
    numberFormatter.positivePrefix = "+"
    return numberFormatter
}()
