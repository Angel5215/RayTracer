
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
}
