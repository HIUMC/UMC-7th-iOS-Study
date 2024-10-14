//
//  ModalViewController.swift
//  실습
//
//  Created by KoNangYeon on 10/5/24.
//

import UIKit
import SnapKit


class ModalViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼 누르면 모달 방식의 화면 전환이 일어남"
        label.textColor = .orange

        button.setTitle("버튼을 눌러주세요!", for: .normal)
        button.backgroundColor = .brown
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
