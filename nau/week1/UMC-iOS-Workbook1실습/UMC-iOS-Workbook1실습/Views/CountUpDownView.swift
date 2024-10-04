//
//  ConutUpDownView.swift
//  UMC-iOS-Workbook1실습
//
//  Created by KoNangYeon on 9/29/24.
//

import UIKit

class CountUpDownView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()//UI컴포넌트를 뷰에 추가하는 코드
    }
    
    private func addComponents(){
        self.addSubview(countLabel)//?
        self.addSubview(countDownButton)
        self.addSubview(countUpButton)
        
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 327),
            countLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 110.5),
            countLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -110.5),
            
            countDownButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
            countDownButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 93),
            
            countUpButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 17),
            countUpButton.leftAnchor.constraint(equalTo: countDownButton.rightAnchor, constant: 7),
        ])//대괄호로 묶여잇음
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")//스토리보드 사용할 경우 지원되지 않도록 하기위함..
    }
    
    public lazy var countLabel: UILabel = {//카운트를 나타냄
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()//UI어쩌구 생성할때 뒤에 ()붙이기
    
    //버튼 내부 텍스트 폰트 지정 컨테이너
    private lazy var titleContainer: AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    //숫자 업 버튼
    public lazy var countUpButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()//?
        
        configuration.image = UIImage(systemName: "arrowtriangle.up.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)//?
        configuration.imagePlacement = .top//?
        configuration.imagePadding = 5//?
        
        configuration.attributedTitle = AttributedString("숫자 올리기", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    public lazy var countDownButton: UIButton = {
        let btn = UIButton()
        
        var configuration = UIButton.Configuration.plain()//?
        
        configuration.image = UIImage(systemName: "arrowtriangle.down.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)//?
        configuration.imagePlacement = .top//?
        configuration.imagePadding = 5//?
        
        configuration.attributedTitle = AttributedString("숫자 내리기", attributes: titleContainer)
        configuration.titleAlignment = .center
        
        btn.configuration = configuration
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()

}
