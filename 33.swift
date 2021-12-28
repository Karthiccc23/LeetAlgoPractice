
T - O( log n)
class Solution {
	func search(_ nums: [Int], _ target: Int) -> Int {
		return binarySearch(nums, target, 0, nums.count-1)
	}

	func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int{

		if left > right {
			return -1
		}

		let middle = (left+right)/2
		var leftVal = nums[left]
		var rightVal = nums[right]
		var middleVal = nums[middle]


		if middleVal == target  {
			return middle
		} else if leftVal <= middleVal {
			// if we get here, the left half of the array isnt rotated, we will test on that side
			// ie 56789123
			if leftVal <= target && target < middleVal {
				// if we get here, the target is in the left half of the array
				return binarySearch(nums, target, left, middle-1)
			} else {
				// if we get here, the target is in the right half of the array
				return binarySearch(nums, target, middle+1, right)
			}

		} else {
			// if we get here, the left half of the array is rotated, we will test on that side
			// ie 891234567
			if middleVal < target && target <= rightVal {
				// if we get here, the target is in the right half of the array
				return binarySearch(nums, target, middle+1, right)
			} else {
				// if we get here, the target is in the left half of the array
				return binarySearch(nums, target, left, middle-1)
			}
		}
	}

}class Solution {
	func search(_ nums: [Int], _ target: Int) -> Int {
		return binarySearch(nums, target, 0, nums.count-1)
	}

	func binarySearch(_ nums: [Int], _ target: Int, _ left: Int, _ right: Int) -> Int{

		if left > right {
			return -1
		}

		let middle = (left+right)/2
		var leftVal = nums[left]
		var rightVal = nums[right]
		var middleVal = nums[middle]


		if middleVal == target  {
			return middle
		} else if leftVal <= middleVal {
			// if we get here, the left half of the array isnt rotated, we will test on that side
			// ie 56789123
			if leftVal <= target && target < middleVal {
				// if we get here, the target is in the left half of the array
				return binarySearch(nums, target, left, middle-1)
			} else {
				// if we get here, the target is in the right half of the array
				return binarySearch(nums, target, middle+1, right)
			}

		} else {
			// if we get here, the left half of the array is rotated, we will test on that side
			// ie 891234567
			if middleVal < target && target <= rightVal {
				// if we get here, the target is in the right half of the array
				return binarySearch(nums, target, middle+1, right)
			} else {
				// if we get here, the target is in the left half of the array
				return binarySearch(nums, target, left, middle-1)
			}
		}
	}

}
