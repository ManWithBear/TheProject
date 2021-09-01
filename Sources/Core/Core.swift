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

extension Recipe {
    static let woodenPlank = Recipe(2, .woodenPlank, ingredients: [.woodenLog: 1])
}
