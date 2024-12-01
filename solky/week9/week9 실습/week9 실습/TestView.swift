//
//  TestView.swift
//  week9 실습
//
//  Created by 이태림 on 12/1/24.
//

import UIKit
import Kingfisher
import SnapKit

class TestView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        constraints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
        
    
    private func setupView() {
        addSubview(imageView)
        addGestureRecognizers()
    }

        
    private func addGestureRecognizers() {
         
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        imageView.addGestureRecognizer(panGesture)

        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture(_:)))
        imageView.addGestureRecognizer(rotationGesture)

           
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        imageView.addGestureRecognizer(pinchGesture)
    }
        
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }

    
    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if let gestureView = sender.view {
            gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        }
        sender.setTranslation(.zero, in: self)
    }

    @objc private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.rotated(by: sender.rotation)
            sender.rotation = 10
        }
    }

      
    @objc private func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }
        
    private func constraints() {
        imageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(300)
        }
    }

}
