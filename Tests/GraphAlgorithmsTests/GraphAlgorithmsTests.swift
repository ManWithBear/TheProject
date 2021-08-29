import XCTest
import GraphAlgorithms

final class GraphAlgorithmsTests: XCTestCase {
    func testTopologicalSort1() {
        var graph = Graph(
            vertices: [2, 3, 5, 7, 8, 9, 10, 11], 
            edges: [
                5: [11],
                7: [11, 8],
                3: [8, 10],
                11: [2, 9, 10],
                8: [9]
            ]
        )
        
        graph.sort()

        assertInTopologicalOrder(graph)
    }

    func testTopologicalSort2() {
        var graph = Graph(
            vertices: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
            edges: [
                1: [2, 3],
                2: [4, 5, 6],
                3: [7, 8, 9],
                4: [10],
                5: [10],
                6: [10],
                7: [10],
                8: [10],
                9: [10],
                10: [11]
            ]
        )

        graph.sort()

        assertInTopologicalOrder(graph)
    }
}

extension XCTestCase {

    /// Graph can have multiple valid topological orders.
    /// Graph in a topological order if and only if for every directed edge uv from vertex u to vertex v, u comes before v in the ordering.
    func assertInTopologicalOrder<T: Hashable>(_ graph: Graph<T>, file: StaticString = #file, line: UInt = #line) {
        for (vertex, edges) in graph.edges {
            guard let vIndex = graph.vertices.firstIndex(of: vertex) else {
                XCTFail("Missing vertex after sort - \(vertex)", file: file, line: line)
                if continueAfterFailure { continue }
                break
            }
            for edge in edges {
                guard let eIndex = graph.vertices.firstIndex(of: edge) else {
                    XCTFail("Missing vertex after sort - \(vertex)", file: file, line: line)
                    if continueAfterFailure { continue }
                    break
                }
                XCTAssert(vIndex < eIndex, "Wrong order of \(vertex) - \(edge), got \(vIndex) and \(eIndex)", file: file, line: line)
            }
        }
    }
}
