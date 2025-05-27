//
//  LoginViewController.swift
//  ATSOPT_Assignment
//
//  Created by MaengKim on 4/16/25.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    var nickname: String?
    
    let nicknameBottomSheetViewController = NicknameBottomSheetViewController()
    
    private let loginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.font = .pretendard(.pretendardRegular, size: 23)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.setPlaceholderColor(.gray2)
        textField.textColor = .gray2
        textField.backgroundColor = .gray4
        textField.font = .pretendard(.pretendardBold, size: 15)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    private let idWarningLabel: UILabel = {
        let label = UILabel()
        label.text = "올바른 이메일 형식을 입력해주세요."
        label.textColor = .brandColorRed
        label.font = .pretendard(.pretendardRegular, size: 12)
        label.isHidden = true
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholderColor(.gray2)
        textField.textColor = .gray2
        textField.backgroundColor = .gray4
        textField.font = .pretendard(.pretendardBold, size: 15)
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인하기", for: .normal)
        btn.titleLabel?.font = .pretendard(.pretendardBold, size: 14)
        btn.setTitleColor(.gray2, for: .normal)
        btn.layer.borderColor = UIColor(named: "gray4")?.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 3
        return btn
    }()
    
    private let findIDLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.font = .pretendard(.pretendardBold, size: 14)
        label.textColor = .gray2
        return label
    }()
    
    private let findPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.font = .pretendard(.pretendardBold, size: 14)
        label.textColor = .gray2
        return label
    }()
    
    private let barView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .pretendard(.pretendardBold, size: 14)
        label.textColor = .gray3
        return label
    }()
    
    private let nicknameButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("닉네임 만들러가기", for: .normal)
        btn.titleLabel?.font = .pretendard(.pretendardRegular, size: 14)
        btn.setTitleColor(.gray2, for: .normal)
        btn.backgroundColor = .none
        btn.setUnderline()
        return btn
    }()
    
    private let secureButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(resource: .eyeSlash), for: .normal)
        btn.isHidden = true
        return btn
    }()
    
    private let allDeleteButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(resource: .xCircle), for: .normal)
        btn.isHidden = true
        return btn
    }()
    
    private var middleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()
    
    private var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 33
        return stackView
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        view.backgroundColor = .black
        
        self.view.addSubviews(
            loginTitleLabel,
            idTextField,
            idWarningLabel,
            passwordTextField,
            loginButton,
            middleStackView,
            bottomStackView,
            allDeleteButton,
            secureButton
        )
        
        middleStackView.addArrangedSubviews(
            findIDLabel,
            barView,
            findPasswordLabel
        )
        
        bottomStackView.addArrangedSubviews(
            signUpLabel,
            nicknameButton
        )
    }
    
    private func setLayout() {
        loginTitleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(120)
        }
        
        idTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginTitleLabel.snp.bottom).offset(25)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        idWarningLabel.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(5)
            $0.leading.equalTo(idTextField.snp.leading)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        secureButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.top).offset(18)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        allDeleteButton.snp.makeConstraints{
            $0.top.equalTo(passwordTextField.snp.top).offset(18)
            $0.trailing.equalTo(secureButton.snp.leading).offset(-16)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        loginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        barView.snp.makeConstraints{
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        middleStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
        }
        
        bottomStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(middleStackView).offset(33)
        }
    }
    
    // MARK: - Func
    
    private func updateButtonEnable() {
        let isPasswordFieldEmpty = passwordTextField.text?.isEmpty ?? true
        allDeleteButton.isHidden = isPasswordFieldEmpty
        secureButton.isHidden = isPasswordFieldEmpty
    }
    
    private func setAddTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        allDeleteButton.addTarget(self, action: #selector(deletePasswordDidTap), for: .touchUpInside)
        secureButton.addTarget(self, action: #selector(togglePasswordDIdTap), for: .touchUpInside)
        nicknameButton.addTarget(self, action: #selector(nicknameButtonDidTap), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(loginTextFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(loginTextFieldDidChange), for: .editingChanged)
    }
    
    private func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
        nicknameBottomSheetViewController.nicknameDelegate = self
    }
    
    private func showSheet() {
        if let sheet = nicknameBottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        
        present(nicknameBottomSheetViewController, animated: true, completion: nil)
    }
    
    @objc
    private func loginTextFieldDidChange() {
        let isFilled = !(idTextField.text?.isEmpty ?? true) && !(passwordTextField.text?.isEmpty ?? true)
        
        let isValidEmail = idTextField.text?.isValidEmail ?? false
        idWarningLabel.isHidden = isValidEmail && !idTextField.text!.isEmpty
        
        if isFilled && isValidEmail {
            loginButton.backgroundColor = .brandColorRed
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginButton.backgroundColor = .clear
            loginButton.setTitleColor(.gray2, for: .normal)
        }
        
        updateButtonEnable()
    }
    
    @objc
    private func togglePasswordDIdTap() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let isSecure = passwordTextField.isSecureTextEntry
        
        if isSecure {
            secureButton.setImage(UIImage(resource: .eyeSlash), for: .normal)
        } else {
            secureButton.setImage(UIImage(resource: .eyeFilled), for: .normal)
        }
    }
    
    @objc
    private func deletePasswordDidTap() {
        passwordTextField.text = ""
        updateButtonEnable()
    }
    
    @objc
    private func loginButtonDidTap() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = nickname
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func nicknameButtonDidTap() {
        showSheet()
    }
}

// MARK: - extension

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
}

extension LoginViewController: DataBindDelegate {
    func bindID(id: String) {
        idTextField.text = id
    }
}

extension LoginViewController: NicknameDelegate {
    func bindNickname(nickname: String) {
        self.nickname = nickname
    }
}
