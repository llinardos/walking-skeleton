import XCTest

class EndToEndTests: XCTestCase {
  func test_shouldIncrementTheCounter() {
    let app = XCUIApplication()
    app.launch()
    
    _ = app.staticTexts["Counter: 0"].waitForExistence(timeout: 1.0)
    app.buttons["Increment"].tap()
    _ = app.staticTexts["Counter: 1"].waitForExistence(timeout: 1.0)
    app.buttons["Increment"].tap()
    _ = app.staticTexts["Counter: 2"].waitForExistence(timeout: 1.0)
  }
}
