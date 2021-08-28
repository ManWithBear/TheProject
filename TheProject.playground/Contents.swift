import UIKit

struct Identifier<T, Raw: Hashable>: RawRepresentable, Equatable, Hashable {
    typealias RawValue = Raw
    let rawValue: Raw
    init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

extension Identifier: Comparable where Raw: Comparable {
    static func < (lhs: Identifier<T, Raw>, rhs: Identifier<T, Raw>) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension Identifier: CustomDebugStringConvertible {
    var debugDescription: String {
        String(describing: rawValue)
    }
}

class Ingredient: CustomDebugStringConvertible {
    typealias ID = Identifier<Ingredient, String>
    let id: ID
    var name: String

    init(name: String) {
        self.id = ID(rawValue: name)
        self.name = name
    }

    var debugDescription: String {
        name
    }
}

struct Recipe: CustomDebugStringConvertible {
    var product: Ingredient.ID
    var amount: Int

    var ingredients: [Ingredient.ID: Int]

    init(_ amount: Int, _ what: Ingredient.ID, ingredients: [Ingredient.ID: Int]) {
        self.product = what
        self.amount = amount
        self.ingredients = ingredients
    }

    var debugDescription: String {
        let header = "Produce \(amount) \(product) from:"
        let tail = ingredients
            .sorted { $0.key < $1.key }
            .map { "- \($0.value) \($0.key)" }
            .joined(separator: "\n")
        return header + "\n" + tail
    }
}
extension Ingredient {
    static let woodenLog = Ingredient(name: "wooden log")
    static let woodenPlank = Ingredient(name: "wooden plank")
    static let ironOre = Ingredient(name: "iron ore")
    static let ironBar = Ingredient(name: "iron bar")
    static let nails = Ingredient(name: "nails")
}

extension Ingredient.ID {
    static var woodenLog: Self { Ingredient.woodenLog.id }
    static var woodenPlank: Self { Ingredient.woodenPlank.id }
    static var ironOre: Self { Ingredient.ironOre.id }
    static var ironBar: Self { Ingredient.ironBar.id }
    static var nails: Self { Ingredient.nails.id }
}

let plankRecipe = Recipe(2, .woodenPlank, ingredients: [.woodenLog: 1])

class RecipeLibrary {
    static let shared = RecipeLibrary()
    var recipes: [Ingredient.ID: Recipe] = [:]
}

class Project {
    var goal: [(Ingredient.ID, amount: Int)]

    init(_ goal: [(Ingredient.ID, amount: Int)]) {
        self.goal = goal
    }
}

class Engine {
    let project: Project
    let recipes: [Ingredient.ID: Recipe]
    var inventory: [Ingredient.ID: Int]
    
    init(_ project: Project) {
        self.project = project
        self.inventory = [:]
        
        var recipes: [Ingredient.ID: Recipe] = [:]
        
        var set: Set<Ingredient.ID> = Set(project.goal.map(\.0))
        while let ingredient = set.popFirst() {
            guard recipes[ingredient] == nil else { continue }
            guard let recipe = RecipeLibrary.shared.recipes[ingredient] else { continue }
            recipes[ingredient] = recipe
            set.formUnion(recipe.ingredients.keys)
        } 
        
        self.recipes = recipes
    }
}
