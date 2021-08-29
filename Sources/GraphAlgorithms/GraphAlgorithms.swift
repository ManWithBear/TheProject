public class TopologicalIterator<Vertex>: IteratorProtocol {
    public func next() -> Vertex? {
        nil
    }
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
        var topologicalVertices: [Vertex] = []
        var notVisitedVertices: Set<Vertex> = Set(vertices)
        var stack: [Vertex] = []
        
        while let entryNode = notVisitedVertices.popFirst() {
            stack.append(entryNode)
            while let vertex = stack.last {
                defer {
                    if stack.last == vertex {
                        stack.removeLast()
                        topologicalVertices.insert(vertex, at: 0)
                    }   
                }
                
                guard let edges = self.edges[vertex] else { continue }
                
                for neighbor in edges where notVisitedVertices.contains(neighbor) {
                    notVisitedVertices.remove(neighbor)
                    stack.append(neighbor)
                }
            }
        }
        
        self.vertices = topologicalVertices
    }
}
