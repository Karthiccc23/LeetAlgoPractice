
T - O(n) S - O(n)
class Solution {
    func evalRPN(_ tokens: [String]) -> Int {


        guard !tokens.isEmpty else { return -1 }
        
        var stack = [Int]()

        for token in tokens {
            switch token {

                case "+":
                    var b = stack.removeLast()
                    var a = stack.removeLast()
                    var result = a+b
                    stack.append(result)
                case "-":
                    var b = stack.removeLast()
                    var a = stack.removeLast()
                    var result = a-b
                    stack.append(result)
                case "*":
                    var b = stack.removeLast()
                    var a = stack.removeLast()
                    var result = a*b
                    stack.append(result)
                case "/":
                    var b = stack.removeLast()
                    var a = stack.removeLast()
                    var result = a/b
                    stack.append(result)
                default:
                    stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }
}
