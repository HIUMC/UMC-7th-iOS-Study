//
//  APITestView.swift
//  APIPractice
//
//  Created by 이현주 on 11/17/24.
//

import UIKit
import SnapKit

class APITestView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addStack()
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var placeholderContainer: [NSAttributedString.Key: Any] = {
        var value = [NSAttributedString.Key: Any]()
        value[.foregroundColor] = UIColor.gray
        value[.font] = UIFont.systemFont(ofSize: 12)
        return value
    }()
    
    public lazy var searchTextField: UITextField = {
        let t = UITextField()
        t.attributedPlaceholder = NSAttributedString(string: "검색하고 싶은 것을 넣으세요!", attributes: placeholderContainer)
        t.leftViewMode = .always
        t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
        t.textColor = UIColor.black
        
        t.clipsToBounds = true
        t.layer.cornerRadius = 10
        t.layer.borderWidth = 2
        t.layer.borderColor = UIColor.black.cgColor
        return t
    }()
    
    public lazy var searchBtn: UIButton = {
        let b = UIButton()
        b.setTitle("검색", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        b.backgroundColor = UIColor.lightGray
        b.clipsToBounds = true
        b.layer.cornerRadius = 8
        return b
    }()
    
    private lazy var title: UILabel = makeTitleLabel("타이틀", font: UIFont.systemFont(ofSize: 20, weight: .bold))
    private lazy var contentsTitle: UILabel = makeTitleLabel("컨텐츠", font: UIFont.systemFont(ofSize: 20, weight: .bold))
    
    public lazy var responseTitle: UILabel = makeTitleLabel("이 부분에 title 값이 들어오도록 해주세요!", font: UIFont.systemFont(ofSize: 20, weight: .light))
    public lazy var responseContentsTitle: UILabel = makeTitleLabel("이 부분에 Contents 값이 들어오도록 해주세요!", font: UIFont.systemFont(ofSize: 20, weight: .light))
    
    /// 상단 텍스트 필드와 버튼 묶음 스택
    private lazy var inputTextStack: UIStackView = makeStack(axis: .horizontal, spacing: 21)
    
    /// Response title 스택
    private lazy var titleLabelStack: UIStackView = makeStack(axis: .vertical, spacing: 14)
    
    /// Response contents 스택
    private lazy var contentsLabelStack: UIStackView = makeStack(axis: .vertical, spacing: 14)
    
    private func makeTitleLabel(_ text: String, font: UIFont) -> UILabel {
        let l = UILabel()
        l.text = text
        l.font = font
        l.textAlignment = .center
        l.textColor = UIColor.black
        l.numberOfLines = 0
        return l
    }
    
    private func makeStack(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let s = UIStackView()
        s.axis = axis
        s.spacing = spacing
        s.distribution = .fill
        return s
    }
    
    private func addStack() {
        [searchTextField, searchBtn].forEach{ inputTextStack.addArrangedSubview($0) }
        [title, responseTitle].forEach{ titleLabelStack.addArrangedSubview($0) }
        [contentsTitle, responseContentsTitle].forEach{ contentsLabelStack.addArrangedSubview($0) }
    }
    
    private func addComponents() {
        [inputTextStack, titleLabelStack, contentsLabelStack].forEach{ self.addSubview($0) }
    }
    
    private func constraints() {
        inputTextStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(94)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().offset(-26)
            make.height.equalTo(43)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.width.equalTo(262)
        }
        
        titleLabelStack.snp.makeConstraints { make in
            make.top.equalTo(inputTextStack.snp.bottom).offset(91)
            make.horizontalEdges.equalToSuperview().inset(18.5)
            make.height.lessThanOrEqualTo(110)
        }
        
        contentsLabelStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabelStack.snp.bottom).offset(91)
            make.horizontalEdges.equalToSuperview().inset(18.5)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
