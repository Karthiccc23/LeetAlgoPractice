
Complexity

Inserting and removing nodes from a linked list is O(1) if we have a pointer to the target node, and that's why we needed the hash map which maps each key to its node in the linked list. This is also O(1).

Any new node will always hold an increased value (when inc() is called) or a decreased value (when dec() is called), and will be inserted before or after the current node. This means the linked list will always be sorted because we insert the nodes in an ordered way. And because the list is sorted, we can access the max and min value in O(1) from the head and the tail of the linked list.

When moving a key from a node to the other we remove it from the old hash set O(1), and insert it in the new hash set O(1).

Summary:

    inc() & dec():
        Access/Insert/Remove from the hash map in O(1)
        Insert/Remove from the linked list in O(1)
        Insert/Remove from the hash set in O(1)
    getMinKey() & getMaxKey():
        Access the head/tail of the linked list in O(1)
        Get a key from the hash set in O(1)




class AllOne {
private var keyNodes = [String: Node]()
private var head: Node? = Node()
private var tail: Node? = Node()

init() {
  head?.next = tail
  tail?.prev = head
}

func inc(_ key: String) {
  let oldNode = keyNodes[key]
  let newValue = (oldNode?.value ?? 0) + 1

  var newNode: Node?
  if let node = (oldNode ?? head)?.next, node.value == newValue {
    newNode = node
  } else {
    newNode = Node()
    newNode?.value = newValue
    (oldNode ?? head)?.insertAfter(newNode)
  }

  update(key, oldNode, newNode)
}

func dec(_ key: String) {
  guard let oldNode = keyNodes[key] else { return }
  let newValue = oldNode.value - 1

  var newNode: Node?
  if let node = oldNode.prev, node.value == newValue {
    newNode = node
  } else if newValue > 0 {
    newNode = Node()
    newNode?.value = newValue
    oldNode.prev?.insertAfter(newNode)
  }

  update(key, oldNode, newNode)
}

func getMaxKey() -> String {
  return tail?.prev?.keys.first ?? ""
}

func getMinKey() -> String {
  return head?.next?.keys.first ?? ""
}

private func update(_ key: String, _ oldNode: Node?, _ newNode: Node?) {
  newNode?.keys.insert(key)
  keyNodes[key] = newNode

  oldNode?.keys.remove(key)
  if oldNode?.keys.isEmpty == true {
    oldNode?.remove()
  }
}
}

private class Node {
var value = -1
var keys = Set<String>()
var next: Node?
var prev: Node?

func insertAfter(_ newNode: Node?) {
  let after = self.next
  self.next = newNode
  newNode?.prev = self
  newNode?.next = after
  after?.prev = newNode
}

func remove() {
  let before = self.prev
  let after = self.next
  before?.next = after
  after?.prev = before
}
}
