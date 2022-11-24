
import RayTracer
import XCTest

class TupleTests: XCTestCase {
    func test_init_withLastComponentOneIsPoint() {
        let tuple = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 1)
        
        XCTAssertEqual(tuple.x, 4.3)
        XCTAssertEqual(tuple.y, -4.2)
        XCTAssertEqual(tuple.z, 3.1)
        XCTAssertEqual(tuple.w, 1.0)
        XCTAssertTrue(tuple.isPoint)
        XCTAssertFalse(tuple.isVector)
    }
    
    func test_init_withLastComponentZeroIsVector() {
        let tuple = Tuple(x: 4.3, y: -4.2, z: 3.1, w: 0)
        
        XCTAssertEqual(tuple.x, 4.3)
        XCTAssertEqual(tuple.y, -4.2)
        XCTAssertEqual(tuple.z, 3.1)
        XCTAssertEqual(tuple.w, 0)
        XCTAssertFalse(tuple.isPoint)
        XCTAssertTrue(tuple.isVector)
    }
    
    func test_point_createsPoint() {
        let tuple = Tuple.point(x: 4, y: -4, z: 3)
        
        XCTAssertEqual(tuple.x, 4)
        XCTAssertEqual(tuple.y, -4)
        XCTAssertEqual(tuple.z, 3)
        XCTAssertEqual(tuple.w, 1)
    }

    func test_vector_createsVector() {
        let tuple = Tuple.vector(x: 4, y: -4, z: 3)

        XCTAssertEqual(tuple.x, 4)
        XCTAssertEqual(tuple.y, -4)
        XCTAssertEqual(tuple.z, 3)
        XCTAssertEqual(tuple.w, 0)
    }

    // MARK: - Operations with methods

    func test_adding_addsCorrespondingComponentsOfTuples() {
        let tuple1 = Tuple(x: 3, y: -2, z: 5, w: 1)
        let tuple2 = Tuple(x: -2, y: 3, z: 1, w: 0)

        let result = tuple1.adding(tuple2)

        XCTAssertEqual(result, Tuple(x: 1, y: 1, z: 6, w: 1))
    }

    func test_subtractingPoints_subtractsCorrespondingElementsOfTuples() {
        let tuple1 = Tuple.point(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.point(x: 5, y: 6, z: 7)

        let result = tuple1.subtracting(tuple2)

        XCTAssertEqual(result, Tuple.vector(x: -2, y: -4, z: -6))
    }

    func test_subtractingVectorFromPoint_subtractsCorrespondingElementsOfTuples() {
        let tuple1 = Tuple.point(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.vector(x: 5, y: 6, z: 7)

        let result = tuple1.subtracting(tuple2)

        XCTAssertEqual(result, Tuple.point(x: -2, y: -4, z: -6))
    }

    func test_subtractingVectors_subtractsCorrespondingElementsOfTuples() {
        let tuple1 = Tuple.vector(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.vector(x: 5, y: 6, z: 7)

        let result = tuple1.subtracting(tuple2)

        XCTAssertEqual(result, Tuple.vector(x: -2, y: -4, z: -6))
    }

    func test_negate_negatesEachComponentOfTuple() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple.negated()

        XCTAssertEqual(result, Tuple(x: -1, y: 2, z: -3, w: 4))
    }

    func test_multipliedByScalar_scalesTupleComponents() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple.multiplied(by: 3.5)

        XCTAssertEqual(result, Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
    }

    func test_multipliedByFraction_scalesTupleComponents() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple.multiplied(by: 0.5)

        XCTAssertEqual(result, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }

    func test_dividedByFactor_scalesTupleComponents() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple.divided(by: 2)

        XCTAssertEqual(result, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }

    // MARK: - Operations with operators

    func test_addingWithOperator_generatesCorrectResults() {
        let tuple1 = Tuple(x: 3, y: -2, z: 5, w: 1)
        let tuple2 = Tuple(x: -2, y: 3, z: 1, w: 0)

        let result = tuple1 + tuple2

        XCTAssertEqual(result, Tuple(x: 1, y: 1, z: 6, w: 1))
    }

    func test_subtractingPointsWithOperator_generatesCorrectResults() {
        let tuple1 = Tuple.point(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.point(x: 5, y: 6, z: 7)

        let result = tuple1 - tuple2

        XCTAssertEqual(result, Tuple.vector(x: -2, y: -4, z: -6))
    }

    func test_subtractingVectorFromPointWithOperator_generatesCorrectResults() {
        let tuple1 = Tuple.point(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.vector(x: 5, y: 6, z: 7)

        let result = tuple1 - tuple2

        XCTAssertEqual(result, Tuple.point(x: -2, y: -4, z: -6))
    }

    func test_subtractingVectorsWithOperator_generatesCorrectResults() {
        let tuple1 = Tuple.vector(x: 3, y: 2, z: 1)
        let tuple2 = Tuple.vector(x: 5, y: 6, z: 7)

        let result = tuple1 - tuple2

        XCTAssertEqual(result, Tuple.vector(x: -2, y: -4, z: -6))
    }

    func test_negate_bySubtractingFromVectorZero() {
        let zero = Tuple.vector(x: 0, y: 0, z: 0)
        let vector = Tuple.vector(x: 1, y: -2, z: 3)

        let result = zero - vector

        XCTAssertEqual(result, Tuple.vector(x: -1, y: 2, z: -3))
    }

    func test_negate_generatesCorrectResults() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple.negated()

        XCTAssertEqual(result, Tuple(x: -1, y: 2, z: -3, w: 4))
    }

    func test_multipliedByScalarWithOperator_generatesCorrectResults() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let resultRight = tuple * 3.5
        let resultLeft = 3.5 * tuple

        XCTAssertEqual(resultRight, Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
        XCTAssertEqual(resultLeft, Tuple(x: 3.5, y: -7, z: 10.5, w: -14))
    }

    func test_multipliedByFractionWithOperator_generatesCorrectResults() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let resultRight = tuple * 0.5
        let resultLeft = 0.4 * tuple

        XCTAssertEqual(resultRight, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
        XCTAssertEqual(resultLeft, Tuple(x: 0.4, y: -0.8, z: 1.2, w: -1.6))
    }

    func test_dividedByScalarWithOperator_scalesTupleComponents() {
        let tuple = Tuple(x: 1, y: -2, z: 3, w: -4)

        let result = tuple / 2

        XCTAssertEqual(result, Tuple(x: 0.5, y: -1, z: 1.5, w: -2))
    }

    func test_equality_considersTwoTuplesEqualWhenTheirDifferenceIsLessThanSomeEpsilonValue() {
        let samples = [
            Tuple(x: 1.690_009, y: 3.520_009, z: 3.120_009, w: 6.920_009),
            Tuple(x: 1.69, y: 3.52, z: 3.12, w: 6.92),
            Tuple(x: 1.689_991, y: 3.519_991, z: 3.119_991, w: 6.919_991),
        ]
        let tuple = Tuple(x: 1.69, y: 3.52, z: 3.12, w: 6.92)

        samples.forEach { sample in
            XCTAssertEqual(tuple, sample, "Tuples should be equal when their difference is less than 1E-5 (0.00001)")
        }
    }

    // MARK: - Additional operations

    func test_magnitude_calculatesVectorsLength() {
        let vectors = [
            Tuple.vector(x: 1, y: 0, z: 0),
            Tuple.vector(x: 0, y: 1, z: 0),
            Tuple.vector(x: 0, y: 0, z: 1),
            Tuple.vector(x: 1, y: 2, z: 3),
            Tuple.vector(x: -1, y: -2, z: -3)
        ]

        let expectedMagnitudes = [1.0, 1.0, 1.0, sqrt(14), sqrt(14)]

        zip(vectors, expectedMagnitudes).forEach { vector, expectedMagnitude in
            XCTAssertEqual(vector.magnitude, expectedMagnitude)
        }
    }

    func test_normalized_returnsTupleWithMagnitudeEqualToOne() {
        let vector1 = Tuple.vector(x: 4, y: 0, z: 0)
        let normalized1 = vector1.normalized()
        XCTAssertEqual(normalized1, Tuple.vector(x: 1, y: 0, z: 0))

        let vector2 = Tuple.vector(x: 1, y: 2, z: 3)
        let normalized2 = vector2.normalized()
        XCTAssertEqual(normalized2, Tuple.vector(x: 0.26726, y: 0.53452, z: 0.80178))
    }

    func test_magnitude_ofNormalizedVectorIsOne() {
        let vector = Tuple.vector(x: 1, y: 2, z: 3)

        let normalizedMagnitude = vector.normalized().magnitude

        XCTAssertEqual(normalizedMagnitude, 1.0)
    }

    func test_dotProduct_returnsScalarValue() {
        let vector1 = Tuple.vector(x: 1, y: 2, z: 3)
        let vector2 = Tuple.vector(x: 2, y: 3, z: 4)

        let dotProduct = vector1.dotProduct(with: vector2)

        XCTAssertEqual(dotProduct, 20.0)
    }
}
