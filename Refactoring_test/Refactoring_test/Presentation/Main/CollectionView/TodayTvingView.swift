//
//  TodayTvingCollectionView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class TodayTvingView: BaseView {
    
    // MARK: - UIComponent
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let titleLabel = UILabel()
    
    private let todayList = TodayTvingModel.dummy()
    
    // MARK: - UISetting
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "오늘의 티빙 TOP 20"
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
            collectionView,
            titleLabel
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(146)
        }
    }
    
    // MARK: - Function
    
    private func register() {
        collectionView.register(
            TodayTvingCollectionViewCell.self,
            forCellWithReuseIdentifier: TodayTvingCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 123, height: 146)
        flowLayout.minimumLineSpacing = 12
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extension

extension TodayTvingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayTvingCollectionViewCell.identifier, for: indexPath) as? TodayTvingCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(todayData: todayList[indexPath.row])
        return cell
    }
}
