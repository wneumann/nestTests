import XCTest
@testable import YoTest

final class YoTestTests: XCTestCase {
  func testExample() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct
      // results.
      XCTAssertEqual(YoTest().text, "Yo, sup?")
  }

  func testYo() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct
      // results.
    XCTAssertEqual(YoTest().yo(), "Yo, Bubba, sup?")
  }

  func testYoName() {
      // This is an example of a functional test case.
      // Use XCTAssert and related functions to verify your tests produce the correct
      // results.
      XCTAssertEqual(YoTest().yo(name: "Frankie"), "Yo, Frankie, sup?")
  }

    static var allTests = [
        ("testExample", testExample),
    ]
}
