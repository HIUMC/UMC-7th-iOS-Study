//
//  UnderBarCustom.swift
//  cloneKream
//
//  Created by 김서현 on 10/31/24.
//



import UIKit

class UnderbarAnimator {
    private weak var underBarView: UIView?
    private weak var segmentedControl: UISegmentedControl?
    
    init(underBarView: UIView, segmentedControl: UISegmentedControl) {
        self.underBarView = underBarView
        self.segmentedControl = segmentedControl
    }
    
    func moveUnderbar(to index: Int) {
        guard let segmentedControl = segmentedControl,
              let underBarView = underBarView,
              let selectedTitle = segmentedControl.titleForSegment(at: index) else { return }
        
        let widthAtIndex = selectedTitle.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]).width
        let finalInset = calculateInset(for: index)
        
        UIView.animate(withDuration: 0.2) {
            underBarView.snp.updateConstraints {
                $0.leading.equalToSuperview().inset(finalInset)
                $0.width.equalTo(widthAtIndex)
            }
            underBarView.superview?.layoutIfNeeded()
        }
    }
    
    private func calculateInset(for index: Int) -> Int {
        var finalInset = 13
        for i in 0..<index {
            guard let title = segmentedControl?.titleForSegment(at: i) else { return finalInset }
            let width = title.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16, weight: .bold)]).width
            finalInset += Int(width) + 32
        }
        return finalInset
    }
}

class SegmentedControlManager {
    private weak var segmentedControl: UISegmentedControl?
    private weak var underbarAnimator: UnderbarAnimator?
    
    init(segmentedControl: UISegmentedControl, underbarAnimator: UnderbarAnimator) {
        self.segmentedControl = segmentedControl
        self.underbarAnimator = underbarAnimator
        setUpActions()
    }
    
    private func setUpActions() {
        segmentedControl?.addTarget(
            self,
            action: #selector(segmentedControlValueChanged),
            for: .valueChanged
        )
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        underbarAnimator?.moveUnderbar(to: sender.selectedSegmentIndex)
    }
}




