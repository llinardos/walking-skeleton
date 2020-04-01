import XCTest
import Core
import KIF

class PurpleCounterVCTests: KIFTestCase {
  func testExposesWillAppear() {
    let sut = PurpleCounterVC()
    expect(PurpleCounterVC.onWillAppearDo, toBeCalledOn: sut) {
      UIApplication.shared.keyWindow?.rootViewController = sut
    }
  }
  
  func testExposesTapOnIncrementButton() {
    let sut = makeAndPresentSut()
    expect(PurpleCounterVC.onIncrementButtonTappedDo, toBeCalledOn: sut) {
      tester().tapView(withAccessibilityIdentifier: "IncrementButton")
    }
  }
  
  func testShowsCounterText() {
    let sut = makeAndPresentSut()
    
    tester().waitForLabel(withAccesibilityIdentifier: "CounterLabel", value: nil)
    sut.setCounterText("Some Text")
    tester().waitForLabel(withAccesibilityIdentifier: "CounterLabel", value: "Some Text")
  }

  private func makeAndPresentSut() -> PurpleCounterVC {
    let vc = PurpleCounterVC()
    UIApplication.shared.keyWindow?.rootViewController = vc
    return vc
  }
}

extension KIFUITestActor {
  func waitForLabel(withAccesibilityIdentifier id: String, value: String?, file: StaticString = #file, line: UInt = #line) {
    let text = (tester().waitForView(withAccessibilityIdentifier: id) as? UILabel)?.text
    XCTAssertEqual(text, value, file: file, line: line)
  }
}

extension XCTestCase {
  func expect<T>( _ callback: (T) -> (@escaping () -> Void) -> (), toBeCalledOn t: T, afterDoing action: () -> Void) {
    let callbackCalledExpectation = expectation(description: "will appear callback")
    callback(t)({
      callbackCalledExpectation.fulfill()
    })
    action()
    wait(for: [callbackCalledExpectation], timeout: 1.0, enforceOrder: false)
  }
}
