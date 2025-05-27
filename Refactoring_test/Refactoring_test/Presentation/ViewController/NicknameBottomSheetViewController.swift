//
//  NicknameBottomSheetViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/24/25.
//

import UIKit

import SnapKit

protocol NicknameDelegate: AnyObject {
    func bindNickname(nickname: String)
}

final class NicknameBottomSheetViewController: UIViewController {
    
    // MARK: - Property
    
    weak var nicknameDelegate: NicknameDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "닉네임을 입력해주세요"
        return label
    }()
    
    private let nicknameTextField: UITextField = {
       let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 14, weight: .medium)
        textField.backgroundColor = .gray2
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let nicknameWarningLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .brandColorRed
        label.textAlignment = .center
        label.text = "한글만 사용 가능합니다."
        label.isHidden = true
        return label
    }()
    
    private let saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("저장하기", for: .normal)
        btn.titleLabel?.font = .pretendard(.pretendardMedium, size: 14)
        btn.setTitleColor(.gray2, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor(named: "gray4")?.cgColor
        return btn
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        addTarget()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        view.backgroundColor = .white
        
        self.view.addSubviews(
            titleLabel,
            nicknameTextField,
            nicknameWarningLabel,
            saveButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        nicknameWarningLabel.snp.makeConstraints{
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(5)
            $0.leading.equalTo(nicknameTextField.snp.leading)
        }
        
        saveButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Func
    
    private func addTarget() {
        nicknameTextField.addTarget(self, action: #selector(nickNameTextFieldDidChange), for: .editingChanged)
        saveButton.addTarget(self, action: #selector (saveButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func nickNameTextFieldDidChange() {
        let text = nicknameTextField.text ?? ""
        let isFilled = !text.isEmpty
        let isValidNickname = text.isKorean
        
        nicknameWarningLabel.isHidden = isValidNickname || !isFilled ? true : false

        if isFilled && isValidNickname {
            saveButton.backgroundColor = .brandColorRed
            saveButton.setTitleColor(.white, for: .normal)
            saveButton.layer.borderColor = UIColor.clear.cgColor
        } else {
            saveButton.backgroundColor = .clear
            saveButton.setTitleColor(.gray2, for: .normal)
            saveButton.layer.borderColor = UIColor(named: "gray4")?.cgColor
        }
    }
    
    @objc
    private func saveButtonDidTap() {
        let nickname = nicknameTextField.text ?? ""
        nicknameDelegate?.bindNickname(nickname: nickname)
        dismiss(animated: true)
    }
}
