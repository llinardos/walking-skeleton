import Foundation

public struct UIEvent {
  public typealias Trigger = (@escaping () -> Void) -> Void
  public typealias Action = () -> Void
  public var trigger: Trigger
  public var action: Action
  init(trigger: @escaping Trigger, action: @escaping Action) {
    self.trigger = trigger
    self.action = action
  }
  
//  init<T>(sender: inout T, keypath: WritableKeyPath<T, () -> Void>) {
//    sender[keyPath: keypath] = action
//  }
//  init(onEventDo: @escaping (@escaping () -> Void) -> Void) {
//    self.trigger = onEventDo
//    connectTriggerAndAction()
//  }
//  func whenHappenDo(_ action: @escaping () -> Void) {
//    self.action = action
//    connectTriggerAndAction()
//  }
  
//  private func connectTriggerAndAction() {
//    trigger(action)
//  }
}

//func on<V, T: AnyObject>(_ view: V, _ event: KeyPath<V, UIEvent>, call target: T, action: @escaping (T) -> Void) {
//  view[keyPath: event].whenHappenDo({ [weak target] in
//    target.map(action)
//  })
//}
//
//func on<V, T: AnyObject>(_ view: V, _ event: KeyPath<V, UIEvent>, call target: T, action: @escaping (T) -> () -> ()) {
//  view[keyPath: event].whenHappenDo({ [weak target] in
//    target.map(action)?()
//  })
//}
