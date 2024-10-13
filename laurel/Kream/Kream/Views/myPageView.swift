//
//  myPageView.swift
//  Kream
//
//  Created by 어진 on 10/9/24.
//

import Foundation
import UIKit


class MyPageView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = .white

        let label = UILabel()
        label.text = "My Page"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}


