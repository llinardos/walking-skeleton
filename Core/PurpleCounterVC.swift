import UIKit

public class PurpleCounterVC: UIViewController {
  private let counterLabel = UILabel()
  private let incrementButton = UIButton()
  private var onIncrementButtonTapped: (() -> Void)?
  private var onWillAppear: (() -> Void)?

  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .purple
    
    view.addSubview(counterLabel)
    counterLabel.translatesAutoresizingMaskIntoConstraints = false
    counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    counterLabel.accessibilityIdentifier = "CounterLabel"
    
    view.addSubview(incrementButton)
    incrementButton.translatesAutoresizingMaskIntoConstraints = false
    incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    incrementButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 20).isActive = true
    incrementButton.accessibilityIdentifier = "IncrementButton"
    
    incrementButton.addTarget(self, action: #selector(onIncrementButtonTap), for: .touchUpInside)
    incrementButton.setTitle("Increment", for: .normal)
  }
  
  public func setCounterText(_ counterText: String) {
    self.counterLabel.text = counterText
  }
  
  public func onIncrementButtonTappedDo(_ action: @escaping () -> Void) {
    self.onIncrementButtonTapped = action
  }
  
  public func onWillAppearDo(_ action: @escaping () -> Void) {
    self.onWillAppear = action
  }
  
  @objc private func onIncrementButtonTap() {
    self.onIncrementButtonTapped?()
  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.onWillAppear?()
  }
}
