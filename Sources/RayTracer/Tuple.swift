
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
