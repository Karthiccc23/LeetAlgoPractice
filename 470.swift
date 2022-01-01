
// T - O(1)
func rand10() -> Int {
    var num = 0
    var row = 0
    var col = 0
    do {
        row = rand7()
        col = rand7()
        num = col + (row - 1) * 7
    } while (num > 40);

    while num >= 40 {

  // Since rand7() has only 7 possible outcomes we need
  // to call it at least twice to get 10 possible outcomes
        let roll1 = rand7()
        let roll2 = rand7()

        // This way there are altogether 49 possible outcomes
  // This arithmetic expression gets a number in range
  // 1...49 from the two rolls
        num = (roll1 - 1) * 7 + (roll2)

        // In order to ensure the equal probability of each call to
  // rand10() we have to disregard the last 9 outcomes
  // as 40 is the greatest number divisible by 10
    }

    return 1 + (num - 1) % 10
}


// EXPLANATION

// There are three concepts in geometric distribution you need to know before you solve these kind of questions. They are very easy to understand.
//
// Expanding a zero-based random
//
// Let's say you have a random10 which return a number from 0 to 9. How would you build random100 which return from 0 to 99?
// You can call random10 to generate each digit. Specifically, 10*random10() will generate the tens' place for a two digit number, and 1*random10() will generate the ones' place. Then the biggest number 10*random10() + 1*random10() could produce is 109+19 = 99. The smallest number is 0
//
// random100 = 10*random10() + 1*random10()
// random1000 = 100*random10() + 10*random10() + 1*random10()
//
// If we change our definition of random, now random10 will return a number from 1 to 10. Can we use the above formula to generate random100(1 to 100)?
//
// The answer is NO.
//
// If you think about it, the 10*random10() + 1*random10() can only return a number from 2 to 101 11 to 110., instead of 1 to 100.
//
// You need to tweak the formula a little bit. Specifically, you need to zero-based your random.
//
// random100 = 10*(random10()-1) + 1*(random10()-1) + 1
//
// Notice that we need to add 1 in the end because 10*(random10()-1) + 1*(random10()-1) will result in a number from 0 to 99, and what we want is actually 1 to 100.
//
// Discarding and Rolling again
//
// If you have a 6 sided dice and want to use it determine "Head or Tail" using this side, and if you get 1, say heads, if you get 2, say tails, and if you get anything else, you discard them by rolling again. This approach will guarantee an equivalent to H/T, but notice you may be rolling the die many times.
//
// Folding to Map
//
// In the above example of dice, an another solution you have is mapping the other values into H or T. For example, 1,2,3 (= heads), 4,5,6 (= tails). When it comes to implementation, we can use module operator to do that.
// E.g,
//
// random3 = random6 % 3 // Assuming the random here is zero-based
//
// Use the three concepts
//
// What we have right now is 1-based random7, and we need to generate random10. Here are the steps we gonna go through:
//
//     zero-based random7: random7-1(0..6)
//     expanding zero-based random7 to zero-based random49: (random7-1)*7 + (random7-1)
//     discarding the number over 40 by rolling again, then we get zero-based random40:
//
//     while(random40>=40){
//     	random40 = (random7-1)*7 + (random7-1)
//     }
//
//     folding zero-based random40 to one-based random10
//
//     random10 = random40%10+1
//
// The complete code:
//
// class Solution extends SolBase {
//     public int rand10() {
//         int rand40 = Integer.MAX_VALUE;
//         while (rand40 >= 40) {
//             rand40 = (rand7() - 1) * 7 + rand7() - 1;
//         }
//         return rand40 % 10 + 1;
//     }
// }
