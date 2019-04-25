import XCTest
@testable import AnyCodingKey

final class AnyCodingKeyTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AnyCodingKey().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
