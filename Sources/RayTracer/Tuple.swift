
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

    public func adding(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x + tuple.x,
            y: y + tuple.y,
            z: z + tuple.z,
            w: w + tuple.w
        )
    }

    public func subtracting(_ tuple: Tuple) -> Tuple {
        Tuple(
            x: x - tuple.x,
            y: y - tuple.y,
            z: z - tuple.z,
            w: w - tuple.w
        )
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
        lhs.adding(rhs)
    }

    public static func -(lhs: Tuple, rhs: Tuple) -> Tuple {
        lhs.subtracting(rhs)
    }
}