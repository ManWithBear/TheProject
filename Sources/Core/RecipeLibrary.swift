class RecipeLibrary {
    static let shared = RecipeLibrary()
    var recipes: [Ingredient.ID: Recipe] = [:]

    init(_ recipes: [Recipe]) {
        self.recipes = Dictionary(
            recipes.map { ($0.product, $0) },
            uniquingKeysWith: { $1 }
        )
    }

    convenience init() {
        self.init([])
    }
}
