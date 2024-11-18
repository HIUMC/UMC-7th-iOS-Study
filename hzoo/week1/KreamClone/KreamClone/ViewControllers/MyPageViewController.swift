//
//  MyPageViewController.swift
//  KreamClone
//
//  Created by 이현주 on 10/7/24.
//

import UIKit
import Alamofire

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mypageView
        getUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.setNavigationBarHidden(true, animated: true) // 뷰 컨트롤러가 나타날 때 숨기기
    }
    
    private lazy var mypageView: MyPageView = {
        let v = MyPageView()
        v.profileManage.addTarget(self, action: #selector(profileMgBtnTapped), for: .touchUpInside)
        return v
    }()
    
    private func getUserInfo() {
        let url = "https://kapi.kakao.com/v2/user/me"
        
        APIClient.shared.request(url, method: .get, parameters: nil) { (result: Result<UserInfoResponse, Error>) in
            switch result {
            case .success(let response):
                self.updateView(response)
            case .failure(let error):
                print("네트워킹 오류: \(error)")
            }
        }
    }
    
    private func updateView(_ model: UserInfoResponse) {
        DispatchQueue.main.async {
            self.mypageView.nickname.text = model.properties?.nickname
        }
    }
    
    @objc
    private func profileMgBtnTapped() {
        let vc = ProfileEditViewController()
        vc.profileManageView.profileImg.image = mypageView.profileImg.image
        navigationController?.pushViewController(vc, animated: true)
    }
}
