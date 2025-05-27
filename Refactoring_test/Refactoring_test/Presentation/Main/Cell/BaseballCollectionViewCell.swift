//
//  BaseballCollectionViewCell.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class BaseballCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BaseballCollectionViewCell"
    
    // MARK: - UIComponent

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
        imageView.do {
            $0.contentMode = .scaleAspectFill
        }
    }
    
    private func setUI() {
        addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - Extension

extension BaseballCollectionViewCell {
    func dataBind(baseballData: BaseballTeamModel) {
        imageView.image = baseballData.image
    }
}
