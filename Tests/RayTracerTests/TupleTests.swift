
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
}
