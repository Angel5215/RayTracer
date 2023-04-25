//
// Created by Ángel Vázquez on 24/11/22.
//

// MARK: - Precedence groups

precedencegroup DotProductPrecedence {
    higherThan: MultiplicationPrecedence
}

precedencegroup CrossProductPrecedence {
    higherThan: DotProductPrecedence
    associativity: left
}

// MARK: - Operators

infix operator .*: DotProductPrecedence
infix operator +*: CrossProductPrecedence
