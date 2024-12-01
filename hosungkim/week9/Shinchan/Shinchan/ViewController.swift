//
//  ViewController.swift
//  Shinchan
//
//  Created by 김호성 on 2024.11.30.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = gestureView
    }
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://s3-alpha-sig.figma.com/img/167c/32a2/e3c3cbcb11f5f360d97841008e96a565?Expires=1733702400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=P2whpnpWFyTVpvP5~BesolMb-n1uVDZ4i~1tLlvqDYXAQUoN6oCRzl3L3Nr7UBhAb86kBgB9DWS~2i3H5VissFXHgGUeXRUzOkEwzCW23SVtvwL0cs9OCIP3a0EadxTD9kTmpyLzrxzBc-ONeprsx4KcYByR3tBU8cKjyI~X0oRb3U0T7-SmgmduO3JubtoDB6oBGjLOLyEQiYfKz-aGaAzatTaxZixZT6heHbQYEz3LljtluvloecIb3eu7zmZgB3Nlg2XqElDc54~gF4yApvBDtnqBDrn75o3oaOs05~pGRIiAIkn4hff6kA9c-FZbY7Rus~M0peyrQ7PzRY4QTg__")
        return view
    }()
}
