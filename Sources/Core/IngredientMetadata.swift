public struct IngredientMetadata {
    public let ingredient: Ingredient
    public var name: String

    public init(ingredient: Ingredient, name: String) {
        self.ingredient = ingredient
        self.name = name
    }
}

extension IngredientMetadata: CustomDebugStringConvertible {
    public var debugDescription: String {
        name
    }
}
