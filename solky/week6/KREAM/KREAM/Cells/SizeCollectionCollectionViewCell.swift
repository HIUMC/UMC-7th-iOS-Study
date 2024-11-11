
import UIKit
import SnapKit
import Then

class SizeCollectionViewCell: UICollectionViewCell {
    static let identifier = "SizeCollectionViewCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstaints()
        sizebutton.addTarget(self, action: #selector(cellselected), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sizebutton = UIButton().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00).cgColor
    }
    
    let sizeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .black
        $0.text = "S"
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = UIColor(red: 0.85, green: 0.35, blue: 0.36, alpha: 1.00)
        $0.text = "360,000"
    }
    
    private func setViews() {
        addSubview(sizebutton)
        addSubview(sizeLabel)
        addSubview(priceLabel)
    }
    
    private func setConstaints() {
        
        sizebutton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(110)
        }
        
        sizeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(8)
            $0.height.equalTo(17)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sizeLabel.snp.bottom)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    public func sizeconfigure(model: SizeModel) {
        self.sizeLabel.text = model.size
        self.priceLabel.text = model.price
    }

    
    
    @objc public func cellselected() {
        if isSelected {
            sizebutton.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
            sizeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
            priceLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        }
    }
    
}
