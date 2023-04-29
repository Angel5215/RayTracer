// Created on 28/04/23. Last modified in 2023.

public struct Tuple {
    public let x: Double
    public let y: Double
    public let z: Double
    public let w: Double

    // MARK: - Color

    public let red: Double
    public let green: Double
    public let blue: Double

    public var isPoint: Bool { w == 1 }
    public var isVector: Bool { w == 0 }

    public init(x: Double, y: Double, z: Double, w: Double) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w

        red = x
        green = y
        blue = z
    }
}
