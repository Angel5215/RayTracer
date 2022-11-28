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
}