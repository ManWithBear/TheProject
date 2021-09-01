import XCTest
@testable import Core

final class EngineTests: XCTestCase {
    func testRecipe() {
        let lib = RecipeLibrary([
            Recipe(2, woodenPlank.id, ingredients: [woodenLog.id: 1]),
            Recipe(1, ironBar.id, ingredients: [ironOre.id: 5]),
            Recipe(4, nails.id, ingredients: [ironBar.id: 1]),
            Recipe(1, stand.id, ingredients: [woodenLog.id: 3]),
            Recipe(1, mailbox.id, ingredients: [woodenPlank.id: 6, nails.id: 6, stand.id: 1])
        ])

        let project = Project([(mailbox.id, 2), (ironBar.id, 10)])

        let engine = Engine(project: project, library: lib)
        engine.preheat()

        let productionTree: [Ingredient.ID: Int] = [
            mailbox.id: 2,
            nails.id: 12,
            ironBar.id: 13,
            ironOre.id: 65,
            woodenPlank.id: 12,
            stand.id: 2,
            woodenLog.id: 12
        ]

        XCTAssertEqual(engine.ingredientsNeeded, productionTree)

        engine.add(3, nails.id)

        XCTAssertEqual(engine.virtualInventory[nails.id], 3)
        XCTAssertEqual(engine.virtualInventory[ironBar.id], 0)

        engine.add(3, nails.id)

        XCTAssertEqual(engine.virtualInventory[nails.id], 6)
        XCTAssertEqual(engine.virtualInventory[ironBar.id], 1)

        engine.add(-3, nails.id)

        XCTAssertEqual(engine.virtualInventory[nails.id], 3)
        XCTAssertEqual(engine.virtualInventory[ironBar.id], 0)
    }
}
