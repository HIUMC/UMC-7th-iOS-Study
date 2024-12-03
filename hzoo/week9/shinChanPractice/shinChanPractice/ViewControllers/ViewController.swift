//
//  ViewController.swift
//  shinChanPractice
//
//  Created by 이현주 on 11/30/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let v = GestureImageView()
        v.loadImage(from: "https://i.namu.wiki/i/iups8Idu4uOYP1MuSgr_GwRPpFRnAJYIaEsOC1NtKUd8LupsLpmw9EwtSKEhTve9Qs6pYajwvyxLjTn42IADyvLG0RjSoptlcNKCrGLV2dU7cdQDDLjmkF-dfsQhZw0Hs5JHgFhA6t6uLRzkUiKhMQ.webp")
        return v
    }()
}

