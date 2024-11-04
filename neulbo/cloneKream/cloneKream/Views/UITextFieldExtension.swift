//
//  UITextFieldExtension.swift
//  cloneKream
//
//  Created by 김서현 on 10/3/24.
//

import UIKit

extension UITextField {
    func addLeftPadding() {
        // width값에 원하는 padding 값을 넣어줍니다.
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
