import XCTest
@testable import Core

final class RecipeTests: XCTestCase {
    func test__productCount__simple() {
        let recipe = Recipe(1, woodenPlank, ingredients: [woodenLog: 1])
        XCTAssertEqual(recipe.pessimisticRecipesPerformed(toGet: 5), 5)
        XCTAssertEqual(recipe.optimisticRecipesCount(toGet: 5), 5)
    }

    func test__productCount__rounded() {
        let recipe = Recipe(2, woodenPlank, ingredients: [woodenLog: 1])
        XCTAssertEqual(recipe.pessimisticRecipesPerformed(toGet: 5), 3)
        XCTAssertEqual(recipe.optimisticRecipesCount(toGet: 5), 2)
    }
}
