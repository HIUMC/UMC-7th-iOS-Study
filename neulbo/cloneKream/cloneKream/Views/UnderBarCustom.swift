//
//  UnderBarCustom.swift
//  cloneKream
//
//  Created by 김서현 on 10/31/24.
//



import UIKit




class CustomSegmentedControl: UISegmentedControl {
    private lazy var underBar: UIView = makeUnderbar()
    
    private lazy var underBarWidth: CGFloat? = bounds.size.width / CGFloat(6)
    
    private var isFirstSettingDone = false
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
      super.init(frame: frame)
      configureUI()
    }
    
    override init(items: [Any]?) {
      super.init(items: items)
      configureUI()
      selectedSegmentIndex = 0
    }
    
    required init?(coder: NSCoder) {
      fatalError()
    }
    
    
    
    
    func configureUI() {
        removeBorders()
        setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        
        apportionsSegmentWidthsByContent = true
    }
    
    func makeUnderbar() -> UIView {
      return {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        addSubview($0)
        NSLayoutConstraint.activate([
          $0.leadingAnchor.constraint(equalTo: leadingAnchor),
          $0.bottomAnchor.constraint(equalTo: bottomAnchor),
          $0.widthAnchor.constraint(equalToConstant: underBarWidth ?? 28),
          $0.heightAnchor.constraint(equalToConstant: 2)])
        return $0
      }(UIView(frame: .zero))
    }
    
    // layer를 어디다가 더해주는 거 같은데??
    func setUnderbarMovableBackgroundLayer() {
      let backgroundLayer = CALayer()
      backgroundLayer.frame = .init(
        x: 0,
        y: bounds.height - 2,
        width: bounds.width,
        height: 2)
        backgroundLayer.backgroundColor = UIColor.clear.cgColor
      layer.addSublayer(backgroundLayer)
    }
    
    
    override func layoutSubviews() {
      super.layoutSubviews()
      if !isFirstSettingDone {
        isFirstSettingDone.toggle()
        setUnderbarMovableBackgroundLayer()
        layer.cornerRadius = 0
        layer.masksToBounds = false
      }
      let underBarLeadingSpacing = CGFloat(selectedSegmentIndex) * (underBarWidth ?? 28)
      UIView.animate(withDuration: 0.27, delay: 0, options: .curveEaseOut, animations: {
        self.underBar.transform = .init(translationX: underBarLeadingSpacing, y: 0)
      })
    }
    
    func removeBorders() {

        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

    }
}








