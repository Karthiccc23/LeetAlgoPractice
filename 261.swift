
// T - O( nodes N + edges E)
class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
	    guard edges.count == n - 1 else { return false }

        var graph = [Int: Set<Int>]()

        var visited = [Int: Bool]()

        for edge in edges {
            graph[edge[0], default: []].insert(edge[1])
            graph[edge[1], default: []].insert(edge[0])
        }
        print(graph)
        if isCycle(&visited, graph, 0, -1)  {
            return false
        }

        for keyy in graph.keys {
         	guard visited[keyy] != nil else {
			    return false
		    }
        }

        return true
    }

    func isCycle(_ visited: inout [Int: Bool],_ graph: [Int:Set<Int>],_ currNode: Int,_ parent: Int) -> Bool {
        if let hasVisited = visited[currNode] {
		    return hasVisited
	    }
        visited[currNode] = true

        if let arr = graph[currNode] {
            for item in arr {
                guard item != parent else { continue }

                if isCycle(&visited, graph, item,currNode) {
                    return true
                }
            }
        }

        return false
    }
}
