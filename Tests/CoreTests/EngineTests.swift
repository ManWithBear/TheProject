import XCTest
@testable import Core

final class EngineTests: XCTestCase {
    func testRecipe() {
        let lib = RecipeLibrary([
            Recipe(2, woodenPlank, ingredients: [woodenLog: 1]),
            Recipe(1, ironBar, ingredients: [ironOre: 5]),
            Recipe(4, nails, ingredients: [ironBar: 1]),
            Recipe(1, stand, ingredients: [woodenLog: 3]),
            Recipe(1, mailbox, ingredients: [woodenPlank: 6, nails: 6, stand: 1])
        ])

        let project = Project([(mailbox, 2), (ironBar, 10)])

        let engine = Engine(project: project, library: lib)
        engine.preheat()

        let productionTree: [Ingredient: Int] = [
            mailbox: 2,
            nails: 12,
            ironBar: 13,
            ironOre: 65,
            woodenPlank: 12,
            stand: 2,
            woodenLog: 12
        ]

        XCTAssertEqual(engine.ingredientsNeeded, productionTree)

        engine.add(3, nails)

        XCTAssertEqual(engine.virtualInventory[nails], 3)
        XCTAssertEqual(engine.virtualInventory[ironBar], 0)

        engine.add(3, nails)

        XCTAssertEqual(engine.virtualInventory[nails], 6)
        XCTAssertEqual(engine.virtualInventory[ironBar], 1)

        engine.add(-3, nails)

        XCTAssertEqual(engine.virtualInventory[nails], 3)
        XCTAssertEqual(engine.virtualInventory[ironBar], 0)
    }
}
