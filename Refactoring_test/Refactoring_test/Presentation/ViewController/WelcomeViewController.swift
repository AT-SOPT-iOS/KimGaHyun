//
//  WelcomeViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/23/25.
//

import UIKit

import SnapKit

protocol DataBindDelegate: AnyObject {
    func bindID(id: String)
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    var id: String?
    
    weak var idDelegate: DataBindDelegate?
    
    private let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .tving)
        return imageView
    }()
    
    private let welcomeTextLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendard(.pretendardBold, size: 23)
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brandColorRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = .pretendard(.pretendardMedium, size: 14)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        bindID()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        view.backgroundColor = .black
        
        self.view.addSubviews(
            tvingImageView,
            welcomeTextLabel,
            mainButton
        )
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(210)
            $0.width.equalToSuperview()
        }
        
        welcomeTextLabel.snp.makeConstraints{
            $0.top.equalTo(tvingImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints{
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Func
    
    private func bindID() {
        if let id = self.id, !id.isEmpty {
            self.welcomeTextLabel.text = "\(id)님 \n반가워요!"
        } else {
            self.welcomeTextLabel.text = "로그인을 해주세요!"
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if let id = id {
            idDelegate?.bindID(id: id)
        }
        
        let mainViewController = MainViewController()
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
}
