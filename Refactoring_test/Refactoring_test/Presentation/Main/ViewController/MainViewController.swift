//
//  MainViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/30/25.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    // MARK: - Property
    
    private let rootView = MainView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    // MARK: - Functions
    
    private func setActions() {
        self.rootView.tabBarView.segmentControl.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
    }
    
    @objc
    private func changeUnderLinePosition(_ segment: UISegmentedControl) {
        rootView.tabBarView.changeUnderLinePosition()
    }
    
    @objc
    private func homeButtonDidTap() {
        // 추후.. 연결
    }
}

extension MainViewController {
    
    func setNavigationBar() {
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .black
        navigationController?.navigationBar.standardAppearance = barAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = barAppearance
        
        let tvingLogoImageView = UIImageView(image: .tvingLogo)
        tvingLogoImageView.contentMode = .scaleAspectFit
        tvingLogoImageView.snp.makeConstraints {
            $0.width.equalTo(120)
            $0.height.equalTo(78)
        }
        let tvingButton = UIBarButtonItem(customView: tvingLogoImageView)
        
        
        let searchImageView = UIImageView(image: .search)
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
        }
        let searchButton = UIBarButtonItem(customView: searchImageView)
        
        let smallLogoImageView = UIImageView(image: .vLogo)
        smallLogoImageView.contentMode = .scaleAspectFit
        smallLogoImageView.snp.makeConstraints{
            $0.width.height.equalTo(30)
        }
        let smallLogoButton = UIBarButtonItem(customView: smallLogoImageView)
        
        navigationItem.leftBarButtonItem = tvingButton
        navigationItem.rightBarButtonItems = [smallLogoButton, searchButton]
    }
}
