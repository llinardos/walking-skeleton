import Foundation

public class Counter {
  private(set) var value: Int
  
  public init() {
    self.value = 0
  }
  
  public func updateCounter() {
    self.value += 1
  }
}

class CounterFormatter {
  func textForCount(_ count: Int) -> String {
    return "Counter: \(count)"
  }
}

public struct CounterView {
  public struct Events {
    public var willAppear: UIEvent
    public var incrementTapped: UIEvent
    public init(willAppear: UIEvent, incrementTapped: UIEvent) {
      self.willAppear = willAppear
      self.incrementTapped = incrementTapped
    }
  }
  public var events: Events
  public var updateCountLabel: (String) -> Void
}
