//
//  TodayTvingCollectionViewCell.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class TodayTvingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TodayTvingCollectionViewCell"
    
    // MARK: - UIComponent
    
    private let rankLabel = UILabel()
    
    private let imageView = UIImageView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        rankLabel.do {
            $0.font = .pretendard(.pretendardBold, size: 50)
            $0.textColor = .white
            $0.transform = CGAffineTransform(rotationAngle: 0.07)
        }
        
        imageView.do {
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setUI() {
        addSubviews(
            rankLabel,
            imageView
        )
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.leading.equalToSuperview().inset(2)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(rankLabel.snp.trailing).offset(2)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
}

// MARK: - Extension

extension TodayTvingCollectionViewCell {
    func dataBind(todayData: TodayTvingModel) {
        rankLabel.text = todayData.rank
        imageView.image = todayData.image
    }
}
