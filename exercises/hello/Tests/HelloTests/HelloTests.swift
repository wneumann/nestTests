import XCTest

@testable import Hello

final class HelloTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Hello().text, "Hello, World!")
  }

  func testHello() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Hello().hello(), "Hello, Bubba!")
  }

  func testHelloName() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Hello().hello(name: "Frankie"), "Hello, Frankie!")
  }

  static var allTests = [
    ("testExample", testExample),
    ("testHello", testHello),
    ("testHelloName", testHelloName)
  ]
}
