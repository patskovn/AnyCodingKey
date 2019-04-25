
import Foundation

public let anyCodingKeyStrategy: JSONDecoder.KeyDecodingStrategy = .custom(AnyCodingKey.convertToProperLowerCamelCase)

private struct AnyCodingKey: CodingKey {
	
	var stringValue: String
	var intValue: Int?
	
	init(_ base: CodingKey) {
		self.init(stringValue: base.stringValue, intValue: base.intValue)
	}
	
	init(stringValue: String) {
		self.stringValue = stringValue
	}
	
	init(intValue: Int) {
		self.stringValue = "\(intValue)"
		self.intValue = intValue
	}
	
	init(stringValue: String, intValue: Int?) {
		self.stringValue = stringValue
		self.intValue = intValue
	}
	
	static func convertToProperLowerCamelCase(keys: [CodingKey]) -> CodingKey {
		guard let last = keys.last else {
			assertionFailure()
			return AnyCodingKey(stringValue: "")
		}
		
		if let fromUpper = convertFromUpperCamelCase(initial: last.stringValue) {
			return AnyCodingKey(stringValue: fromUpper)
		} else if let fromSnake = convertFromSnakeCase(initial: last.stringValue) {
			return AnyCodingKey(stringValue: fromSnake)
		} else {
			return AnyCodingKey(last)
		}
	}
	
	private static func convertFromSnakeCase(initial: String) -> String? {
		let underscore: Character = "_"
		guard initial.firstIndex(of: underscore) != nil else { return nil }
		
		var result = ""
		// We should uppercase nextCharacter if previous was underscore.
		var shouldUppercaseNextCharacter = false
		for (index, character) in initial.enumerated() {
			if character == "_" {
				// We should not delete first and last underscores (_asd_ert_ -> _asdErt_)
				if index == 0 || index == initial.count - 1 {
					result.append(character)
				} else {
					shouldUppercaseNextCharacter = true
				}
			} else {
				if shouldUppercaseNextCharacter {
					let uppercased = String(character).uppercased()
					result.append(uppercased)
					shouldUppercaseNextCharacter = false
				} else {
					result.append(character)
				}
			}
		}
		
		return result
	}
	
	
	private static func convertFromUpperCamelCase(initial: String) -> String? {
		guard !initial.isEmpty else { return nil }
		let firstChar = String(initial.first!)
		guard firstChar != firstChar.lowercased() else { return nil }
		
		var result = ""
		var previousCharacterUppercased = true
		for (index, character) in initial.enumerated() {
			
			let str = String(character)
			let lower = str.lowercased()
			
			// We should check next character case for proper Abbreviation converts
			// asdEFG -> asdEfg
			// ASDEfg -> asdEfg
			// AsdEfg -> asdEfg
			// helloREADINGDeveloper -> helloReadingDeveloper
			var nextCharacterUppercased = false
			if index < initial.count - 1 {
				let nextCharacter = initial[initial.index(initial.startIndex, offsetBy: index + 1)]
				let nextCharacterStr = String(nextCharacter)
				nextCharacterUppercased = nextCharacterStr != nextCharacterStr.lowercased()
			}
			
			if lower != str {
				if previousCharacterUppercased && nextCharacterUppercased || index == 0 || index == initial.count - 1 {
					result.append(lower)
				} else {
					result.append(character)
				}
			} else {
				result.append(character)
			}
			
			previousCharacterUppercased = str != lower
		}
		
		return result
	}
}
