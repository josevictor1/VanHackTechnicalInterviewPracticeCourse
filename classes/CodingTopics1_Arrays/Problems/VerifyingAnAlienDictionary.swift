class Solution {
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        guard !words.isEmpty && words.count > 1 else { return true }
        let orderDictionary = makeOrderDictionary(order)
        return areWordsSorted(words, byOrder: orderDictionary)
    }
    
    private func areWordsSorted(_ words: [String],
                                byOrder order: [Character: Int]) -> Bool {
        for (index, element) in words.enumerated() where index + 1 <  words.count {
            let nextWord = words[index + 1]
            let nextWordLength = nextWord.count
            let elementLength = element.count
            let minimum = min(elementLength, nextWordLength)
            for characterIndex in 0..<minimum {
                if element[characterIndex] != nextWord[characterIndex],
                   order[element[characterIndex]]! > order[nextWord[characterIndex]]! {
                    return false
                } else if element[characterIndex] != nextWord[characterIndex],
                          order[element[characterIndex]]! < order[nextWord[characterIndex]]! {
                    break
                } else if characterIndex == minimum - 1, elementLength > nextWordLength {
                    return false
                }
            }
        }
        return true
    }
    
    private func makeOrderDictionary(_ order: String) -> [Character: Int] {
        var orderDictionary = [Character: Int]()
        order.enumerated().forEach { (index, element) in
            orderDictionary[element] = index
        }
        return orderDictionary
    }
}

extension StringProtocol {
    subscript(_ offset: Int) -> Element { self[index(startIndex, offsetBy: offset)] }
}
