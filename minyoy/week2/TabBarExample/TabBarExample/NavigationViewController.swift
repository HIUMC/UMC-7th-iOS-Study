
import UIKit

import SnapKit

class NavigationViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 내비게이션 방식의 화면 전환이 일어나요"
        label.textColor = .black
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemPurple
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .systemPink
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
