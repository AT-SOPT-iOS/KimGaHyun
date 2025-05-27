//
//  SponsorView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class SponsorView: BaseView {
    
    // MARK: - UIComponent
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let sponsorList = SponsorModel.dummy()
    
    
    // MARK: - UISetting
    
    override func setStyle() {
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
            $0.height.equalTo(45)
        }
    }
    
    // MARK: - Function
    
    private func register() {
        collectionView.register(
            SponsorCollectionViewCell.self,
            forCellWithReuseIdentifier: SponsorCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 90, height: 45)
        flowLayout.minimumInteritemSpacing = 7
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extension

extension SponsorView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SponsorCollectionViewCell.identifier, for: indexPath) as? SponsorCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(sponsorData: sponsorList[indexPath.row])
        
        cell.backgroundColor = .gray4
        cell.layer.cornerRadius = 4
        return cell
    }
}

