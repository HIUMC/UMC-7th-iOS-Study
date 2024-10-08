
import UIKit

class ProfileManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view = profileManagerView
    }
    
    private lazy var profileManagerView: ProfileManagerView = {
        let view = ProfileManagerView()
        view.leftArrowButton.addTarget(self, action: #selector(btnDidup), for: .touchUpInside)
        return view
    }()
    
    @objc private func btnDidup() {
        self.navigationController?.popViewController(animated: true)
    }
}
