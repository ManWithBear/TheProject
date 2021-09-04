extension Ingredient {
    static let woodenLog = Ingredient("wooden log")
    static let woodenPlank = Ingredient("wooden plank")
    static let ironOre = Ingredient("iron ore")
    static let ironBar = Ingredient("iron bar")
    static let nails = Ingredient("nails")
}

extension Recipe {
    static let woodenPlank = Recipe(2, .woodenPlank, ingredients: [.woodenLog: 1])
}
