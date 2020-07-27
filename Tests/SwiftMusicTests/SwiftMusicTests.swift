import XCTest
@testable import SwiftMusic

final class SwiftMusicTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftMusic().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
