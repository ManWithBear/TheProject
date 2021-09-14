import GraphAlgorithms

public class Engine {
    public let project: Project
    public let library: RecipeLibrary
    public var inventory: [Ingredient: Int] { virtualInventory }

    var recipes: [Ingredient: Recipe] = [:]

    private var userInventory: [Ingredient: Int] = [:]
    var virtualInventory: [Ingredient: Int] = [:]

    var sortedIngredients: [Ingredient] = []
    var ingredientsNeeded: [Ingredient: Int] = [:]

    public init(project: Project, library: RecipeLibrary) {
        self.project = project
        self.library = library
    }

    public func preheat() {
        recipes = [:]

        var set: Set<Ingredient> = Set(project.goal.map(\.0))
        while let ingredient = set.popFirst() {
            guard recipes[ingredient] == nil else { continue }
            guard let recipe = library.recipes[ingredient] else { continue }
            recipes[ingredient] = recipe
            set.formUnion(recipe.ingredients.keys)
        }

        sortedIngredients = sortInTopologicalOrder(
            vertices: project.goal.map(\.0),
            edgesProvider: { recipes[$0]?.ingredients.keys }
        )

        for (ingredient, amount) in project.goal {
            ingredientsNeeded[ingredient, default: 0] += amount
        }

        for product in sortedIngredients {
            guard let recipe = recipes[product] else { continue }
            // it's safe to force unwrap here.
            // we travel the ingredients list in a topological order, that means all ingredients, that depends on this one, have been visited already
            // and changed this value to non-nil
            let productNeeded = ingredientsNeeded[product]!
            let recipesCount = recipe.pessimisticRecipesPerformed(toGet: productNeeded)
            for (ingredient, amount) in recipe.ingredients {
                ingredientsNeeded[ingredient, default: 0] += recipesCount * amount
            }
        }
    }

    public func add(_ count: Int, _ product: Ingredient) {
        userInventory[product, default: 0] += count

        guard recipes[product] != nil else {
            // no need to rebuild virtual inventory for leaves
            virtualInventory[product, default: 0] += count
            return
        }

        var virtualInventory = userInventory
        for product in sortedIngredients {
            guard let recipe = recipes[product],
                  let productsCollected = virtualInventory[product],
                  productsCollected != 0
            else { continue }

            let recipesCount = recipe.optimisticRecipesCount(toGet: productsCollected)
            for (ingredient, amount) in recipe.ingredients {
                virtualInventory[ingredient, default: 0] += recipesCount * amount
            }
        }

        self.virtualInventory = virtualInventory
    }
}

extension Engine: CustomDebugStringConvertible {
    public var debugDescription: String {
        project.debugDescription
            + "\nCurrent state:\n"
            + sortedIngredients
                .map { "- \(virtualInventory[$0, default: 0]) / \(ingredientsNeeded[$0]!) x \($0)"}
                .joined(separator: "\n")
    }
}
