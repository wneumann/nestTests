import XCTest

@testable import CouchSurf

final class CouchSurfTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(CouchSurf().text, "Yo, I'm surfing on your couch!")
  }

  func testSurf() {
    XCTAssertEqual(CouchSurf().surf(), "Yo, Bubba, I'm surfing on your couch!")
  }

  func testSurfName() {

    XCTAssertEqual(CouchSurf().surf(name: "Frankie"), "Yo, Frankie, I'm surfing on your couch!")
  }

  static var allTests = [
    ("testExample", testExample),
    ("testSurf", testSurf),
    ("testSurfName", testSurfName),
  ]
}
