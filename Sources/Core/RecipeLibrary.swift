public class RecipeLibrary {
    public static let shared = RecipeLibrary()
    public var recipes: [Ingredient: Recipe] = [:]

    public init(_ recipes: [Recipe]) {
        self.recipes = Dictionary(
            recipes.map { ($0.product, $0) },
            uniquingKeysWith: { $1 }
        )
    }

    public convenience init() {
        self.init([])
    }
}
