// Created on 30/04/23. Last modified in 2023.

import Foundation

public extension Matrix4 {
    static func translation(x: Double, y: Double, z: Double) -> Self {
        var translationMatrix = identity
        translationMatrix[0, 3] = x
        translationMatrix[1, 3] = y
        translationMatrix[2, 3] = z
        return translationMatrix
    }

    static func scaling(x: Double, y: Double, z: Double) -> Self {
        var translationMatrix = identity
        translationMatrix[0, 0] = x
        translationMatrix[1, 1] = y
        translationMatrix[2, 2] = z
        return translationMatrix
    }
}
