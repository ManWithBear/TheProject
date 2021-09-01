import XCTest
@testable import Core

// MARK: - Ingredients

// MARK: - Recipe tests


// MARK: - Core tests
final class CoreTests: XCTestCase {
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

        print("Preheat")
        print(engine)

        engine.add(3, nails.id)

        print("Add 3 nails")
        print(engine)

        engine.add(3, nails.id)

        print("Add 3 nails")
        print(engine)

        engine.add(-3, nails.id)

        print("Remove 3 nails")
        print(engine)
    }
}
