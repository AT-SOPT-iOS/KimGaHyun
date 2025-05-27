//
//  KHLifeCollectionViewCell.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class KHLifeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KHLifeCollectionViewCell"
    
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
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setUI() {
        addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
}

// MARK: - Extension

extension KHLifeCollectionViewCell {
    func dataBind(khLifeData: KHLifeModel) {
        imageView.image = khLifeData.image
    }
}
