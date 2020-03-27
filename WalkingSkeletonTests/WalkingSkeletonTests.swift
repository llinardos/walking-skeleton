import XCTest
@testable import WalkingSkeleton

class RedVCShould: XCTestCase {
  func test_beRed() {
    let sut = RedVC()
    sut.loadViewForTests()
    XCTAssertEqual(sut.view.backgroundColor, .red, "RedVC should be red")
  }
}

extension UIViewController {
  func loadViewForTests() {
    _ = self.loadViewIfNeeded()
  }
}
