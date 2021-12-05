import Foundation

let vowels: Set<Character> = Set(["a", "e", "i", "o", "u"])

func solution(s: String) -> String {
    guard !s.isEmpty else { return Classification.good.rawValue }
    return classify(string: s).rawValue
}

private func classify(string: String) -> Classification {
    if areThereQuestionMarks(onString: string) {
        return classifyQuestionMarkComposedString(string)
    } else {
        return classifyNonQuestionMarkComposedString(string)
    }
}

private func classifyQuestionMarkComposedString(_ string: String) -> Classification {
    guard !string.contains("???") else { return .mixed }
    let vowelReplacingClassification = classifyString(string, replacingQuestionTo: "a")
    let consonantReplacingClassification = classifyString(string, replacingQuestionTo: "b")
    return vowelReplacingClassification == consonantReplacingClassification ? vowelReplacingClassification : .mixed
}

private func classifyString(_ string: String, replacingQuestionTo letter: String) -> Classification {
    let replacedString = string.replacingOccurrences(of: "?", with: letter)
    return classifyNonQuestionMarkComposedString(replacedString)
}

private func classifyNonQuestionMarkComposedString(_ string: String) -> Classification {
    var consonantCount = 0
    var vowelCount = 0
    for character in string {
        if type(for: character) == .vowel {
            vowelCount += 1
            consonantCount = 0
        } else {
            consonantCount += 1
            vowelCount = 0
        }
        guard consonantCount < 5 && vowelCount < 3 else { return .bad }
    }
    return .good
}

private func areThereQuestionMarks(onString string: String) -> Bool {
    string.contains { type(for: $0) == .questionMark }
}

private func type(for character: Character) -> CharacterType {
    if vowels.contains(character) {
        return .vowel
    } else if character == "?" {
        return .questionMark
    } else {
        return .consonant
    }
}

enum CharacterType {
    case vowel
    case consonant
    case questionMark
}

enum Classification: String {
    case bad
    case good
    case mixed
}