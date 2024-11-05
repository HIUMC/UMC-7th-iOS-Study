//
//  MypageViewController.swift
//  KREAM
//
//  Created by 이태림 on 10/8/24.
//

import UIKit

class MypageViewController: UIViewController {
    
    private lazy var myview: MypageView = {
            let view = MypageView()
            view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
            return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myview
        
        myview.profilemanageButton.addTarget(self, action: #selector(manage), for: .touchUpInside)
    }
    
    @objc
    private func manage() {
        let viewcontroller = ProfileManageViewController()
        
        viewcontroller.receivedData = myview.profileImage.image
        
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
