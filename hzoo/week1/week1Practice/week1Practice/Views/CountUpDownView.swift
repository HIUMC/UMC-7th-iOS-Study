//
//  CountUpDownView.swift
//  week1Practice
//
//  Created by 이현주 on 10/2/24.
//

import UIKit

class CountUpDownView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponenets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var countLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        l.textColor = .black
        l.text = "1"
        l.textAlignment = .center
        
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    public lazy var titleContainer: AttributeContainer = {
        var c = AttributeContainer()
        c.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        c.foregroundColor = UIColor.black
        
        return c
    }()
    
    public lazy var countUpButton: UIButton = {
        let b = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "arrowtriangle.up.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        configuration.attributedTitle = AttributedString("숫자 올리기", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        b.configuration = configuration
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }()
    
    public lazy var countDownButton: UIButton = {
        let b = UIButton()
        
        var configuration = UIButton.Configuration.plain()
        
        configuration.image = UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        configuration.attributedTitle = AttributedString("숫자 내리기", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        b.configuration = configuration
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }()
    
    private func addComponenets() {
        self.addSubview(countLabel)
        self.addSubview(countUpButton)
        self.addSubview(countDownButton)
        
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 362),
            countLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 111),
            countLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -111),
            
            countDownButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
            countDownButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 93),
            
            countUpButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
            countUpButton.leftAnchor.constraint(equalTo: countDownButton.rightAnchor, constant: 7)
        ])
    }
}
