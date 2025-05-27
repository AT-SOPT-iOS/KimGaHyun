//
//  realtimeLiveCollectionViewCell.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class RealtimeLiveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RealTimeLiveCollectionViewCell"
    
    // MARK: - UIComponent
    
    private let imageView = UIImageView()
    private let rankLabel = UILabel()
    private let titleLabel = UILabel()
    private let detailInfoLabel = UILabel()
    private let percentageLabel = UILabel()
    
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
        imageView.do {
            $0.layer.cornerRadius = 3
        }
        
        rankLabel.do {
            $0.font = .pretendard(.pretendardBold, size: 19)
            $0.textColor = .white
            $0.transform = CGAffineTransform(rotationAngle: 0.07)
        }
        
        titleLabel.do {
            $0.textColor = .white
            $0.font = .pretendard(.pretendardMedium, size: 10)
        }
        
        detailInfoLabel.do {
            $0.textColor = .gray2
            $0.font = .pretendard(.pretendardRegular, size: 10)
        }
        
        percentageLabel.do {
            $0.textColor = .gray2
            $0.font = .pretendard(.pretendardRegular, size: 10)
        }
    }
    
    private func setUI() {
        addSubviews(
            imageView,
            rankLabel,
            titleLabel,
            detailInfoLabel,
            percentageLabel
        )
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        rankLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.leading.equalTo(imageView.snp.leading).offset(6)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(4)
        }
        
        detailInfoLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        percentageLabel.snp.makeConstraints{
            $0.top.equalTo(detailInfoLabel.snp.bottom)
            $0.leading.equalTo(detailInfoLabel.snp.leading)
        }
    }
}

// MARK: - Extension

extension RealtimeLiveCollectionViewCell {
    func dataBind(realtimeLiveData: RealtimeLiveModel) {
        imageView.image = realtimeLiveData.image
        rankLabel.text = "\(realtimeLiveData.rank)"
        titleLabel.text = realtimeLiveData.title
        detailInfoLabel.text = realtimeLiveData.detailInfo
        percentageLabel.text = realtimeLiveData.percentage
    }
}
