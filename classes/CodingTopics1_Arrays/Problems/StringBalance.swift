//Task Description
//An S string is built up from "+" and "-" characters exclusively. The balance of such string is the number of all plus characters subtracted by the number of all minus characters within S.
//
//For example the balance of "++-+" is 2 and the balance of "+-+-" is 0.
//
//You can modify the account balance by removing the rightmost character. This result can be further modified using this same method until the resulting string is empty.
//
//Your task is to write a function that accepts String S and Integer N. This function returns the minimum number of removals necessary for the balance to become greater than or equal to N. If the desired balance isn’t achievable the function should return -1.
//
//Example:
//possibleBalance("++-", 2) // should return 1
//
//possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 12) // 1
//possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 13) // 2
//possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 14) // -1
//possibleBalance("+++---", 3) // 3
//possibleBalance("+++-+---", 3) // 3
//possibleBalance("----+-", -2) // 4

// String S and Integer N


func possibleBalance(_ string: String, _ disiredBalance: Int) -> Int {
    var operators = string.map { $0 }
    var operatorsCounter = countOperators(operators: operators)
    var removalCounter = 0
    while !operators.isEmpty && operatorsCounter.balance < disiredBalance {
        let operatorSymbol = operators.removeLast()
        if operatorSymbol == "-" {
            operatorsCounter.minus -= 1
        } else {
            operatorsCounter.plus -= 1
        }
        removalCounter += 1
    }
    return operators.isEmpty ? -1 : removalCounter
}

private func countOperators(operators: [Character]) -> OperatorsCounter {
    var operatorsCounter = OperatorsCounter()
    operators.forEach { operatorSymbol in
        if operatorSymbol == "-" {
            operatorsCounter.minus += 1
        } else {
            operatorsCounter.plus += 1
        }
    }
    return operatorsCounter
}


struct OperatorsCounter {
    var minus: Int = 0
    var plus: Int = 0
    var balance: Int { plus - minus }
}

// Test cases
// possibleBalance("++-", 2) //1
// possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 12) // 1
// possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 13) // 2
// possibleBalance("+++-++-++--+-++++-+--++-++-+-++++-+++--", 14) // -1
// possibleBalance("+++---", 3) // 3
// possibleBalance("+++-+---", 3) // 3
// possibleBalance("----+-", -2) // 4
