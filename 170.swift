T: O(n) S: O(n)
class TwoSum {

    private var countHash = [Int: Int]()

    //  Initialize your data structure here.
    init() { }

    // Add the number to an internal data structure.
    func add(_ value: Int) {
		// Keep track of the number of times the value is added. Used later to determine the solution.
        if let count = countHash[value] {
            countHash[value] = count + 1
        }
        else {
            countHash[value] = 1
        }
    }

    func find(_ value: Int) -> Bool {
        // GUARD: If the dictionary is empty, just return.
        guard !countHash.isEmpty else {
            return false
        }
		/*
			Solution:

			For all the numbers and their respective counts, check if the difference
			is found in the dictionary. If the difference is found, it means the complement
			number has already been added in a previous "add" call. Therefore, there exists
			a possible solution of two numbers that can be added together to form the find value.

			Exception Case:

			If there is only 1 unique number in the list, and the target value (passed from the find(...))
		    is 2x the unique number, then the difference will equal the original added number. For example,
			if a list contains just [1] and we call find(2), then 2 - 1 = 1. The difference (1) is still in the
			dictionary, but the solution is incorrect because we need two values. Therefore, we must use
			the count in the dictionary to differentiate when unique numbers are present, versus when
			single numbers are found that can still be found in the dictionary...

			Another edge case to consider is adding 0, and calling find(0) immediately
			after. This produces a similar problem like the case above, where 0 - 0 is still 0.

			Performance:

			Time Complexity: O(n) - It's possible to traverse the entire list without finding the value
			Space Complexity: O(n) - It's possible to add all unique values inside the dictionary.
       */
        for addedNumber in countHash.keys {
            // Get the difference and see if it's been added to the list.
            let difference = value - addedNumber
            // If has already been added to the list, check if it's a repeat number.
            if let foundNumberCount = countHash[difference] {
                // If it's not a repeat number, ensure at least one is found.
                if difference != addedNumber && foundNumberCount > 0 {
                    return true
                }
                // If it is an identical number, ensure at least two is found to verify
                // two numbers were entered.
                else if (difference == addedNumber) && foundNumberCount > 1 {
                    return true
                }
            }
        }
        return false
    }
}
