
import UIKit

class ProfileManagerViewController: UIViewController {
    
    public var receivedData: UIImage?
    
    private let loginModel = LoginModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view = profileManagerView
        loadLoginValue()
        
        if let data = receivedData {
            profileManagerView.profileImage.image = data
        }
    }
    
    private lazy var profileManagerView: ProfileManagerView = {
        let view = ProfileManagerView()
        view.leftArrowButton.addTarget(self, action: #selector(btnDidup), for: .touchUpInside)
        view.userEmailEditButton.addTarget(self, action: #selector(userEmailBtnDidTap), for: .touchUpInside)
        view.userPasswordEditButton.addTarget(self, action: #selector(userPasswordBtnDidTap), for: .touchUpInside)
        return view
    }()
    
    @objc private func btnDidup() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func userEmailBtnDidTap() {
        if profileManagerView.userEmailEditButton.title(for: .normal) == "변경" {
            profileManagerView.userEmailEditButton.setTitle("확인", for: .normal)
            profileManagerView.userEmailTextField.isUserInteractionEnabled = true
        }
        
        else if profileManagerView.userEmailEditButton.title(for: .normal) == "확인" {
            if let newId = profileManagerView.userEmailTextField.text, !newId.isEmpty {
                loginModel.saveUserId(newId)
            }
            profileManagerView.userEmailEditButton.setTitle("변경", for: .normal)
            profileManagerView.userEmailTextField.isUserInteractionEnabled = false
        }
    }
    
    @objc private func userPasswordBtnDidTap() {
        if profileManagerView.userPasswordEditButton.title(for: .normal) == "변경" {
            profileManagerView.userPasswordEditButton.setTitle("확인", for: .normal)
            profileManagerView.userPasswordTextField.isUserInteractionEnabled = true
            profileManagerView.userPasswordTextField.isSecureTextEntry = false
        }
        
        else if profileManagerView.userPasswordEditButton.title(for: .normal) == "확인" {
            if let newPwd = profileManagerView.userPasswordTextField.text, !newPwd.isEmpty {
                loginModel.saveUserPwd(newPwd)
            }
            profileManagerView.userPasswordEditButton.setTitle("변경", for: .normal)
            profileManagerView.userPasswordTextField.isUserInteractionEnabled = false
            profileManagerView.userPasswordTextField.isSecureTextEntry = true
        }
    }
    
    private func loadLoginValue() {
        if let savedId = loginModel.loadUserId() {
            profileManagerView.userEmailTextField.text = savedId
        }
        
        if let savedPwd = loginModel.loadUserPwd() {
            profileManagerView.userPasswordTextField.text = savedPwd
        }
    }
}
