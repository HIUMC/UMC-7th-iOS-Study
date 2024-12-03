//
//  GestureImageView.swift
//  shinChanPractice
//
//  Created by 이현주 on 11/30/24.
//

import UIKit
import SnapKit
import Kingfisher

class GestureImageView: UIView {
    
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
    
    public lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.isUserInteractionEnabled = true
        return i
    }()
    
    private func setupView() {
        addSubview(imageView)
        addGestureRecognizers()
    }
    
    private func addGestureRecognizers() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        imageView.addGestureRecognizer(panGesture)
        
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotationGesture))
        imageView.addGestureRecognizer(rotationGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        imageView.addGestureRecognizer(pinchGesture)
    }
    
    public func loadImage(from url: String) {
        if let imageURL = URL(string: url) {
            imageView.kf.setImage(with: imageURL)
        }
    }
    
    @objc
    private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        if let gestureView = sender.view {
            gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        }
        sender.setTranslation(.zero, in: self)
    }
    
    @objc
    private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.rotated(by: sender.rotation)
            sender.rotation = 10
        }
    }
    
    @objc
    private func handlePinchGesture(_ sender: UIPinchGestureRecognizer) {
        if let gestureView = sender.view {
            gestureView.transform = gestureView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1.0
        }
    }
    
    private func constraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(safeAreaLayoutGuide)
            make.height.width.equalTo(300)
        }
    }
}
