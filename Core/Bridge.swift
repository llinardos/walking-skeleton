import UIKit

var noGCd: [AnyObject] = []

public func counterVC() -> UIViewController {
  let counter = Counter()
  let vc = PurpleCounterVC()
  
  vc.onIncrementButtonTappedDo {
    counter.updateCounter()
    vc.setCounterText(CounterFormatter().textForCount(counter.value))
  }
  vc.onWillAppearDo {
    vc.setCounterText(CounterFormatter().textForCount(counter.value))
  }
  
  noGCd.append(counter)
  
  return vc
}
