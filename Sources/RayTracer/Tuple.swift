
public struct Tuple {
    public let x: Double
    public let y: Double
    public let z: Double
    public let w: Double

    public var isPoint: Bool { w == 1 }
    public var isVector: Bool { w == 0 }
    
    public init(x: Double, y: Double, z: Double, w: Double) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}

extension Tuple: Equatable {
    public static func ==(lhs: Tuple, rhs: Tuple) -> Bool {
        let epsilon = 0.000_001
        let isXEqual = abs(lhs.x - rhs.x) <= epsilon
        let isYEqual = abs(lhs.y - rhs.y) <= epsilon
        let isZEqual = abs(lhs.z - rhs.z) <= epsilon
        return isXEqual && isYEqual && isZEqual
    }
}