struct IngredientMetadata: CustomDebugStringConvertible {
    let ingredient: Ingredient
    var name: String

    init(ingredient: Ingredient, name: String) {
        self.ingredient = ingredient
        self.name = name
    }

    var debugDescription: String {
        name
    }
}
