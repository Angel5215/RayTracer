// Created on 30/04/23. Last modified in 2023.

import RayTracer

extension Matrix4 {
    enum Error: Swift.Error {
        case nonInvertible
    }

    func invert() throws -> Matrix4 {
        guard let inverted = inverted() else { throw Error.nonInvertible }
        return inverted
    }
}
