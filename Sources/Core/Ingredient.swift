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
