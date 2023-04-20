//
// Created by Ángel Vázquez on 19/04/23.
//

@testable import RayTracer
import XCTest

class ConstrainedPropertyWrapperTests: XCTestCase {
    func test_wrappedValue_withinRangeReturnsSameValue() {
        let sut = Constrained(wrappedValue: 155, minimum: 0, maximum: 255)

        XCTAssertEqual(sut.wrappedValue, 155)
        XCTAssertEqual(sut.projectedValue, 155)
    }

    func test_wrappedValue_returnsMinimumValueWhenWrappedValueIsLessThanMinimum() {
        let sut = Constrained(wrappedValue: -1, minimum: 0, maximum: 255)

        XCTAssertEqual(sut.wrappedValue, 0)
        XCTAssertEqual(sut.projectedValue, -1)
    }

    func test_wrappedValue_returnsMaximumValueWhenWrappedValueIsGreaterThanMaximum() {
        let sut = Constrained(wrappedValue: 256, minimum: 0, maximum: 255)

        XCTAssertEqual(sut.wrappedValue, 255)
        XCTAssertEqual(sut.projectedValue, 256)
    }

    func test_wrappedValueWithPropertyWrapper_withinRangeReturnsSameValue() {
        @Constrained(minimum: 0, maximum: 255) var wrappedValue = 155

        XCTAssertEqual(wrappedValue, 155)
        XCTAssertEqual($wrappedValue, 155)
    }

    func test_wrappedValueWithPropertyWrapper_returnsMinimumValueWhenWrappedValueIsLessThanMinimum() {
        @Constrained(minimum: 0, maximum: 255) var wrappedValue = -1

        XCTAssertEqual(wrappedValue, 0)
        XCTAssertEqual($wrappedValue, -1)
    }

    func test_wrappedValueWithPropertyWrapper_returnsMaximumValueWhenWrappedValueIsGreaterThanMaximum() {
        @Constrained(minimum: 0, maximum: 255) var wrappedValue = 256

        XCTAssertEqual(wrappedValue, 255)
        XCTAssertEqual($wrappedValue, 256)
    }
}
