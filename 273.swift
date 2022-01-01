
// T - O(n) S - O(n)
class Solution {

    let ones = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen",
                "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let tens = ["", "", "Twenty", "Thirty","Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]

    func numberToWords(_ num: Int) -> String {
        var result = ""
        numberToWordsRecursive(num, result: &result)
        return result
    }

    func numberToWordsRecursive(_ num: Int, result: inout String) {
        print(result)
        print(num)
        if num >= 1000000000 {
            numberToWordsRecursive(num/1000000000, result: &result)
            result.append(" Billion")
            let remainder = num % 1000000000
            if remainder > 0 {
                result.append(" ")
                numberToWordsRecursive(remainder, result: &result)
            }
        } else if num >= 1000000 {
            numberToWordsRecursive(num/1000000, result: &result)
            result.append(" Million")
            let remainder = num % 1000000
            if remainder > 0 {
                result.append(" ")
                numberToWordsRecursive(remainder, result: &result)
            }
        } else if num >= 1000 {
            numberToWordsRecursive(num/1000, result: &result)
            result.append(" Thousand")
            let remainder = num % 1000
            if remainder > 0 {
                result.append(" ")
                numberToWordsRecursive(remainder, result: &result)
            }
        } else if num >= 100 {
            numberToWordsRecursive(num/100, result: &result)
            result.append(" Hundred")
            let remainder = num % 100
            if remainder > 0 {
                result.append(" ")
                numberToWordsRecursive(remainder, result: &result)
            }
        } else if num >= 20 {
            result.append(tens[num / 10])
            let remainder = num % 10
            if remainder > 0 {
                result.append(" ")
                numberToWordsRecursive(remainder, result: &result)
            }
        } else {
            result.append(ones[num])
        }
    }
}
