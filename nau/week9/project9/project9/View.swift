//
//  View.swift
//  project9
//
//  Created by KoNangYeon on 11/27/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        constraints()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    private func setupView() {
        addSubview(imageView)
        addGestureRecognizers()
    }
    
    private func addGestureRecognizers() {
        let fanGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        imageView.addGestureRecognizer(fanGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture(_:)))
        imageView.addGestureRecognizer(rotationGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        imageView.addGestureRecognizer(pinchGesture)
    }
    
    // 팬 제스처 핸들러
    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if let gestureView = sender.view {
            gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        }
        sender.setTranslation(.zero, in: self)
    }

    // 회전 제스처 핸들러
    @objc private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }

    // 핀치 제스처 핸들러
    @objc private func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }
    
    private func constraints() {
        imageView.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(300)
        }
    }
}
