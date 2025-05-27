//
//  MainFooterView.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 5/2/25.
//

import UIKit

import SnapKit
import Then

final class MainFooterView: BaseView {
    
    // MARK: - UIComponent
    
    private let askingLabel = UILabel()
    private let termsLabel = UILabel()
    private let privacyLabel = UILabel()
    private let licenseLabel = UILabel()
    private let recruitLabel = UILabel()
    private let dotLabel1 = UILabel()
    private let dotLabel2 = UILabel()
    private let dotLabel3 = UILabel()
    
    // MARK: - UISetting
    
    override func setStyle() {
        askingLabel.do {
            $0.text = "고객문의"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        termsLabel.do {
            $0.text = "이용약관"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        privacyLabel.do {
            $0.text = "개인정보처리방침"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .white
        }
        
        licenseLabel.do {
            $0.text = "사업자정보"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        recruitLabel.do {
            $0.text = "인재채용"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
        
        [dotLabel1, dotLabel2, dotLabel3].forEach {
            $0.text = "·"
            $0.font = .pretendard(.pretendardMedium, size: 11)
            $0.textColor = .gray2
        }
    }
    
    override func setUI() {
        addSubviews(
            askingLabel,
            termsLabel,
            privacyLabel,
            licenseLabel,
            recruitLabel,
            dotLabel1,
            dotLabel2,
            dotLabel3
        )
    }
    
    override func setLayout() {
        askingLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        dotLabel1.snp.makeConstraints{
            $0.centerY.equalTo(askingLabel.snp.centerY)
            $0.leading.equalTo(askingLabel.snp.trailing).offset(3)
        }
        
        termsLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(dotLabel1.snp.trailing).offset(3)
        }
        
        dotLabel2.snp.makeConstraints{
            $0.centerY.equalTo(termsLabel.snp.centerY)
            $0.leading.equalTo(termsLabel.snp.trailing).offset(3)
        }
        
        privacyLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(dotLabel2.snp.trailing).offset(3)
        }
        
        licenseLabel.snp.makeConstraints{
            $0.top.equalTo(askingLabel.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        dotLabel3.snp.makeConstraints{
            $0.centerY.equalTo(licenseLabel.snp.centerY)
            $0.leading.equalTo(licenseLabel.snp.trailing).offset(3)
        }
        
        recruitLabel.snp.makeConstraints{
            $0.top.equalTo(termsLabel.snp.bottom)
            $0.leading.equalTo(dotLabel3.snp.trailing).offset(3)
            $0.bottom.equalToSuperview().inset(99)
        }
    }
}
