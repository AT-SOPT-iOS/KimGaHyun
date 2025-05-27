//
//  RealtimeMovieView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class RealtimeMovieView: BaseView {
    
    // MARK: - UIComponent
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let titleLabel = UILabel()
    private let moreButton = UIButton()
    
    private let movieList = RealtimeMovieModel.dummy()
    
    // MARK: - UISetting
    
    override func setStyle() {
        titleLabel.do {
            $0.text = "실시간 인기 영화"
            $0.font = .pretendard(.pretendardBold, size: 15)
            $0.textColor = .white
        }
        
        moreButton.do {
            $0.titleLabel?.font = .pretendard(.pretendardMedium, size: 12)
            $0.setTitle("더보기", for: .normal)
            $0.titleLabel?.textColor = .gray2
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
            titleLabel,
            moreButton
        )
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        moreButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(6)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(146)
        }
    }
    
    // MARK: - Function
    
    private func register() {
        collectionView.register(
            RealtimeMovieCollectionViewCell.self,
            forCellWithReuseIdentifier: RealtimeMovieCollectionViewCell.identifier
        )
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 98, height: 146)
        flowLayout.minimumLineSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

// MARK: - Extension

extension RealtimeMovieView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealtimeMovieCollectionViewCell.identifier, for: indexPath) as? RealtimeMovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(movieData: movieList[indexPath.row])
        return cell
    }
}

