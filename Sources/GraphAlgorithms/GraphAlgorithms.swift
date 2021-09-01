/// Sort graph vertices in a topological order assuming that graph is DAG.
/// Using simplified DFS algorithm.
/// https://en.wikipedia.org/wiki/Topological_sorting#Depth-first_search
public func sortInTopologicalOrder<Vertex: Hashable, Edges: Sequence>(
    vertices: [Vertex],
    edgesProvider: (Vertex) -> Edges?
) -> [Vertex] where Edges.Element == Vertex {
    var topologicalVertices: [Vertex] = []
    var visitedVertices: Set<Vertex> = []
    var stack: [Vertex] = []

    for entryNode in vertices {
        guard !visitedVertices.contains(entryNode) else { continue }
        visitedVertices.insert(entryNode)

        stack.append(entryNode)
        while let vertex = stack.last {
            defer {
                if stack.last == vertex {
                    stack.removeLast()
                    topologicalVertices.insert(vertex, at: 0)
                }
            }

            guard let edges = edgesProvider(vertex) else { continue }

            for neighbor in edges where !visitedVertices.contains(neighbor) {
                visitedVertices.insert(neighbor)
                stack.append(neighbor)
            }
        }
    }

    return topologicalVertices
}

public struct Graph<Vertex: Hashable> {
    public var vertices: [Vertex]
    public var edges: [Vertex: [Vertex]]
    
    public init(vertices: [Vertex], edges: [Vertex: [Vertex]]) {
        self.vertices = vertices
        self.edges = edges
    }
    
    /// Sort `vertices` in a topological order.
    /// Using simplified DFS algorithm (assume graph is DAG)
    /// https://en.wikipedia.org/wiki/Topological_sorting#Depth-first_search
    public mutating func sort() {
        self.vertices = sortInTopologicalOrder(vertices: vertices, edgesProvider: { edges[$0] })
    }
}
