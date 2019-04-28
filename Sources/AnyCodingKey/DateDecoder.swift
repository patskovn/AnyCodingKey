
import Foundation

public let universalDateDecodingStrategy = JSONDecoder.DateDecodingStrategy.custom { dateDecoder in
	let container = try dateDecoder.singleValueContainer()
	
	if let dateStr = try? container.decode(String.self), let date = Date.parseDateTime(dateStr) {
		return date
	} else if let miliseconds = try? container.decode(TimeInterval.self) {
		let seconds = miliseconds / 1000
		return Date(timeIntervalSince1970: seconds)
	} else {
		throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date")
	}
}

extension Date {
	
	struct Format {
		static let onlyDate = DateFormatter(format: "yyyy-MM-dd")
		static let full = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSx")
		static let noWMS = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ssZ")
		static let noWTZ = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSS")
		static let noWMSnoWTZ = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss")
	}
	
	static func parseDateTime(_ text: String) -> Date? {
		let notWTZ = text.contains("+")
		let notWMS = text.contains(".")
		let noTime = text.contains(":")
		let haveZSymbol = text.contains("Z")
		
		if noTime {
			return Format.onlyDate.date(from: text)
		} else if notWTZ && !haveZSymbol {
			if notWMS {
				return Format.noWMSnoWTZ.date(from: text)
			} else {
				return Format.noWTZ.date(from: text)
			}
		} else {
			if notWMS {
				return Format.noWMS.date(from: text)
			} else {
				return Format.full.date(from: text)
			}
		}
	}
}

extension DateFormatter {
	convenience init(format: String) {
		self.init()
		self.dateFormat = format
	}
}
