//
//  KHLifeView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class KHLifeView: BaseView {
    
    // MARK: - UIComponent
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let titleLabel = UILabel()
    
    private let lifeList = KHLifeModel.dummy()
    
    // MARK: - UISetting
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "김가현PD의 인생작 TOP 5"
            $0.font = .pretendard(.pretendardBold, size: 15)
            $0.textColor = .white
        }
        
        collectionView.do {
            $0.backgroundColor = .black
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    override func setUI() {
        register()
        setCollectionViewLayout()
        
        collectionView.dataSource = self
        
        addSubviews(
            titleLabel,
            collectionView
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(90)
        }
    }
    
    // MARK: - Function
    
    private func register() {
        collectionView.register(
            KHLifeCollectionViewCell.self,
            forCellWithReuseIdentifier: KHLifeCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 160, height: 90)
        flowLayout.minimumLineSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extension

extension KHLifeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lifeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KHLifeCollectionViewCell.identifier, for: indexPath) as? KHLifeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(khLifeData: lifeList[indexPath.row])
        cell.layer.cornerRadius = 8
        return cell
    }
}
