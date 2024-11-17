//
//  MyPageViewController.swift
//  MyKream
//
//  Created by 김호성 on 2024.10.03.
//

import UIKit
import SnapKit
import Alamofire

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MyPageViewController")
        
        self.view = myPageView
        navigationController?.isNavigationBarHidden = true
        getProfile()
    }
    
    private func getProfile() {
        let url = "https://kapi.kakao.com/v2/user/me"
        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(AccountManager.shared.accessToken)",
//            "Content-Type": "application/x-www-form-urlencoded;charset=utf-8"
        ]
        APIClient.shared.request(url, method: .get, headers: headers) { (result: Result<KakaoMemberInfoEntity, Error>) in
            switch result {
            case .success(let response):
                self.updateView(response.properties!)
            case .failure(let error):
                print("네트워킹 오류: \(error)")
            }
            
        }
    }
    
    private func updateView(_ kakaoAccountEntity: KakaoMemberInfoEntity.KakaoAccountEntity) {
        myPageView.lbName.text = kakaoAccountEntity.nickname
//        print("UPDATEVIEW")
        URLSession.shared.dataTask(with: URL(string: kakaoAccountEntity.profile_image!)!) { [weak self] data, response, error in
            if let profile = UIImage(data: data!) {
                DispatchQueue.main.async {
                    self?.myPageView.ivProfile.image = profile
                }
            }
        }.resume()
    }
    
    private lazy var myPageView: MyPageView = {
        let view = MyPageView()
        
        view.btnManageProfile.addTarget(self, action: #selector(onClickManageProfile), for: .touchUpInside)
        return view
    }()
    
    @objc func onClickManageProfile() {
        let viewController = ManageProfileViewController()
        viewController.manageProfileView.ivProfile.image = myPageView.ivProfile.image
        navigationController?.pushViewController(viewController, animated: true)
    }
}
