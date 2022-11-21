
public struct Tuple {
    public let x: Double
    public let y: Double
    public let z: Double
    public let w: Double
    
    public init(x: Double, y: Double, z: Double, w: Double) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}

extension Tuple {
    public var isPoint: Bool { w == 1 }
    
    public var isVector: Bool { w == 0 }
}

extension Tuple {
    public static func point(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 1)
    }

    public static func vector(x: Double, y: Double, z: Double) -> Tuple {
        Tuple(x: x, y: y, z: z, w: 0)
    }
}

extension Tuple: Equatable {}

extension Tuple {
    public static func +(lhs: Tuple, rhs: Tuple) -> Tuple {
        Tuple(
            x: lhs.x + rhs.x,
            y: lhs.y + rhs.y,
            z: lhs.z + rhs.z,
            w: lhs.w + rhs.w
        )
    }
}