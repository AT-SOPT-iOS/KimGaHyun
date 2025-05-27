//
//  MainView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class MainView: BaseView {
    
    // MARK: - UIComponents
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let tabBarView = TabBarView()
    
    let todayTvingView = TodayTvingView()
    let realtimeLiveView = RealtimeLiveView()
    let realtimeMovieView = RealtimeMovieView()
    let baseballView = BaseballView()
    let sponsorView = SponsorView()
    let khLifeView = KHLifeView()
    let noticeView = NoticeView()

    let mainMovieImageView = UIImageView()
    
    private let footerView = MainFooterView()
    
    // MARK: - UISetting
    
    override func setStyle() {
        self.do {
            $0.backgroundColor = .clear
        }
        
        mainMovieImageView.do {
            $0.image = .whatSurname
        }
    }
    
    override func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            tabBarView,
            mainMovieImageView,
            todayTvingView,
            realtimeLiveView,
            realtimeMovieView,
            baseballView,
            sponsorView,
            khLifeView,
            noticeView,
            footerView
        )
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        tabBarView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        
        mainMovieImageView.snp.makeConstraints{
            $0.top.equalTo(tabBarView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        todayTvingView.snp.makeConstraints{
            $0.top.equalTo(mainMovieImageView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(204)
        }
        
        realtimeLiveView.snp.makeConstraints{
            $0.top.equalTo(todayTvingView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(170)
        }
        
        realtimeMovieView.snp.makeConstraints{
            $0.top.equalTo(realtimeLiveView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(192)
        }
        
        baseballView.snp.makeConstraints{
            $0.top.equalTo(realtimeMovieView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        sponsorView.snp.makeConstraints{
            $0.top.equalTo(baseballView.snp.bottom).offset(28)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        khLifeView.snp.makeConstraints{
            $0.top.equalTo(sponsorView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(126)
        }
        
        noticeView.snp.makeConstraints{
            $0.top.equalTo(khLifeView.snp.bottom).offset(23)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(50)
        }
        
        footerView.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom).offset(13)
            $0.leading.equalTo(noticeView.snp.leading)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}
