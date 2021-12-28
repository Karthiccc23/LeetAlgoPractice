/**
 * The knows API is defined in the parent class Relation.
 *     func knows(_ a: Int, _ b: Int) -> Bool;
 */


T - O(n)
class Solution : Relation {

    func findCelebrity(_ n: Int) -> Int {
        // A person is a celebrity if this person
        //    1. Doesn't know anybody
        //    2. Is known by everybody
        var potentialCelebrity: Int = 0
        for person in 0 ..< n where person != potentialCelebrity {
            if knows(potentialCelebrity, person) {
                potentialCelebrity = person
            }
        }

        // After the above questioning and we have our potential celebrity,
        // determine if the potential celebrity is indeed a celebrity.
        for person in 0 ..< n where person != potentialCelebrity {
                                           // ↓↓ THIS is what prevents Time Limit Exceeded?! Come on.
            let celebrityKnowsSomeone = person < potentialCelebrity && knows(potentialCelebrity, person)
            let personDoesntKnowCelebrity = !knows(person, potentialCelebrity)
            if celebrityKnowsSomeone || personDoesntKnowCelebrity {
                return -1
            }
        }

        return potentialCelebrity
    }

}
