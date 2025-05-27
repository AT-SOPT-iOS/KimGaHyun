//
//  BaseballView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class BaseballView: BaseView {
    
    // MARK: - UIComponent
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let baseballList = BaseballTeamModel.dummy()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .clear
        }
        collectionView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    override func setUI() {
        register()
        setCollectionViewLayout()
        
        collectionView.dataSource = self
        
        addSubview(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    // MARK: - Function
    
    private func register() {
        collectionView.register(
            BaseballCollectionViewCell.self,
            forCellWithReuseIdentifier: BaseballCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 80, height: 50)
        
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extension

extension BaseballView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseballList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseballCollectionViewCell.identifier, for: indexPath) as? BaseballCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(baseballData: baseballList[indexPath.row])
        cell.backgroundColor = indexPath.row % 2 == 0 ? .black : .white
        return cell
    }
}

