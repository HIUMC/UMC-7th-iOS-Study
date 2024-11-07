//
//  ProfileEditViewController.swift
//  Kream
//
//  Created by 어진 on 10/31/24.
//

import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {

    override func loadView() {
        self.view = ProfileEditView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "프로필 관리"
    }
}

