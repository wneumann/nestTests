import XCTest

@testable import Goodbye

final class GoodbyeTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Goodbye().text, "Goodbye, World!")
  }

  func testGoodbye() {
    XCTAssertEqual(Goodbye().bye(), "Goodbye, Bubba!")
  }

  func testGoodbyeName() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Goodbye().bye(name: "Frankie"), "Goodbye, Frankie!")
  }

  static var allTests = [
    ("testExample", testExample),
    ("testGoodbye", testGoodbye),
    ("testGoodbyeName", testGoodbyeName),
  ]
}
