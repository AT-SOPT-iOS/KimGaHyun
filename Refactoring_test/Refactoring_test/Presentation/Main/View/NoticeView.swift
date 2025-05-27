//
//  NoticeView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class NoticeView: BaseView {
    
    // MARK: - UIComponents
    
    private let titleLabel = UILabel()
    private let noticeLabel = UILabel()
    private let nextButton = UIButton()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .gray4
            $0.layer.cornerRadius = 5
        }
        
        titleLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .white
        }
        
        noticeLabel.do {
            $0.text = "공지"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        nextButton.do {
            $0.setImage(.nextBtn, for: .normal)
        }
    }
    
    override func setUI() {
        addSubviews(
            titleLabel,
            noticeLabel,
            nextButton
        )
    }
    
    override func setLayout() {
        noticeLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(17)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
        }
        
        nextButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(18)
        }
    }
}
