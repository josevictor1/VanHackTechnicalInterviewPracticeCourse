final class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var subtractionResultDictionary = [Int: Int]()
        nums.enumerated().forEach { (index, element) in
            let subtractionResult = target - element
            subtractionResultDictionary[subtractionResult] = index
        }
        
        for (index, element) in nums.enumerated() {
            if let secondElementIndex = subtractionResultDictionary[element],
            secondElementIndex != index {
                return [index, secondElementIndex]
            }
        }
        return []
    }
}
