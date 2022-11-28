//
// Created by Ángel Vázquez on 27/11/22.
//

import RayTracer
import XCTest

class ColorTests: XCTestCase {
    func test_color_initializesColorValues() {
        let color = Tuple.color(red: -0.5, green: 0.4, blue: 1.7)

        XCTAssertEqual(color.red, -0.5)
        XCTAssertEqual(color.green, 0.4)
        XCTAssertEqual(color.blue, 1.7)
    }

    func test_adding_createsNewColorWithSumOfEachComponent() {
        let color1 = color(red: 0.9, green: 0.6, blue: 0.75)
        let color2 = color(red: 0.7, green: 0.1, blue: 0.25)

        let result1 = color1.adding(color2)
        let result2 = color1 + color2

        XCTAssertEqual(result1, color(red: 1.6, green: 0.7, blue: 1.0))
        XCTAssertEqual(result2, color(red: 1.6, green: 0.7, blue: 1.0))
    }

    func test_subtracting_createsNewColorSubtractingComponents() {
        let color1 = color(red: 0.9, green: 0.6, blue: 0.75)
        let color2 = color(red: 0.7, green: 0.1, blue: 0.25)

        let result1 = color1.subtracting(color2)
        let result2 = color1 - color2

        XCTAssertEqual(result1, color(red: 0.2, green: 0.5, blue: 0.5))
        XCTAssertEqual(result2, color(red: 0.2, green: 0.5, blue: 0.5))
    }

    func test_multiplyingWithScalar_createsNewColorMultiplyingEachComponentByTheScalar() {
        let color = Tuple.color(red: 0.2, green: 0.3, blue: 0.4)

        let result1 = 2 * color
        let result2 = color * 2

        XCTAssertEqual(result1, Tuple.color(red: 0.4, green: 0.6, blue: 0.8))
        XCTAssertEqual(result2, Tuple.color(red: 0.4, green: 0.6, blue: 0.8))
    }
}