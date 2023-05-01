// Created on 28/04/23. Last modified in 2023.

// MARK: - Precedence groups

precedencegroup DotProductPrecedence {
    higherThan: MultiplicationPrecedence
}

precedencegroup CrossProductPrecedence {
    higherThan: DotProductPrecedence
    associativity: left
}

precedencegroup CompositionPrecedence {
    higherThan: DotProductPrecedence
    associativity: left
}

// MARK: - Operators

infix operator .*: DotProductPrecedence
infix operator +*: CrossProductPrecedence
infix operator >>>: CompositionPrecedence
