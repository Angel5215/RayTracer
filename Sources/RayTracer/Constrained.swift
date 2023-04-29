// Created on 28/04/23. Last modified in 2023.

@propertyWrapper struct Constrained {
    let wrappedValue: Int
    let projectedValue: Int

    init(wrappedValue: Int, minimum: Int, maximum: Int) {
        projectedValue = wrappedValue
        self.wrappedValue = Self.constrain(value: wrappedValue, between: minimum, and: maximum)
    }

    private static func constrain(value: Int, between minimum: Int, and maximum: Int) -> Int {
        max(minimum, min(value, maximum))
    }
}
