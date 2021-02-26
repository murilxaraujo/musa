import XCTest
@testable import Musa

final class MusaTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Musa().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
