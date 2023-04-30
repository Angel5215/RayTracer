// Created on 30/04/23. Last modified in 2023.

import Foundation
import RayTracer

@main
enum MatrixExperiment {
    private static let separator = "-----\n"

    static func main() throws {
        print(separator)
        print("> What happens when you invert the identity matrix?")
        try print(Matrix4.identity.invert())
        try print("\n>> Is equal to Identity? -> ", Matrix4.identity == Matrix4.identity.invert())
        print(separator)

        print("> What do you get when you multiply a matrix by its inverse?")
        let matrix = Matrix4(values: [3, -9, 7, 3, 3, -8, 2, -9, -4, 4, 4, 1, -6, 5, -1, 1])
        let inverseMatrix = try matrix.invert()
        print(matrix * inverseMatrix)
        print("\n>> Is equal to Identity? -> ", matrix * inverseMatrix == Matrix4.identity)
        print(separator)

        print("> Is there any difference between the inverse of the transpose of a matrix, and the transpose of the inverse?")
        print("\n>> Inverse of the transpose.")
        try print(matrix.transposed().invert())
        print("\n>> Transpose of the inverse.")
        try print(matrix.invert().transposed())
        try print("\n>> Are they equal? -> ", matrix.transposed().invert() == matrix.invert().transposed())
        print(separator)

        print(
            """
            Remember how multiplying the identity matrix by a tuple gives you the
            tuple, unchanged? Now, try changing any single element of the identity matrix 
            to a different number, and then multiplying it by a tuple. What happens to the tuple?
            """
        )
        let tuple = Tuple(x: 1, y: -2, z: 3, w: 4.5)
        var mutableIdentity = Matrix4.identity
        mutableIdentity[1, 1] = 2
        print("\n>> Tuple")
        print(tuple)
        print("\n>> Modified identity matrix")
        print(mutableIdentity)
        print("\n>> Multiply modified identity with tuple")
        print(mutableIdentity * tuple)
        print(separator)
    }
}
