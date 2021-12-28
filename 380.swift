
All O(1) ops

class RandomizedSet {
    var dict:[Int: Int] = [:]
    var list:[Int] = []

    /** Initialize your data structure here. */
    init() {
    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if let v = dict[val] {
            return false
        }

        list.append(val)
        dict[val] = list.count-1
        return true
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if let v = dict[val] {
            var temp = list.removeLast()
            list.insert(temp, at: v)
            dict.removeValue(forKey: val)
            return true
        }
        return false
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        return list.randomElement()!
    }
}
