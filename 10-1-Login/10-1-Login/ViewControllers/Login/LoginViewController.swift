//
//  LoginViewController.swift
//  10-1-Login
//
//  Created by JongHoon on 2022/10/07.
//

import Then
import SnapKit
import UIKit

final class LoginViewController: UIViewController {
    
    private let hideIcon = UIImage(named: "hide")
    private let showIcon = UIImage(named: "show")
    
    private lazy var phoneNumberStackView = InfoStackView(
        title: "휴대폰 번호",
        placeholder: "휴대폰 번호를 입력해 주세요.",
        message: "존재하지 않는 핸드폰 번호 입니다."
    )
    
    private lazy var passwordStackView = InfoStackView(
        title: "비밀번호",
        placeholder: "비밀번호를 입력해 주세요.",
        message: "비밀번호가 일치하지 않습니다."
    ).then {
        $0.textField.isSecureTextEntry = true
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xD2D2D2)
        $0.layer.cornerRadius = 12.0
        $0.addTarget(
            self,
            action: #selector(moveToCompleteLogin),
            for: .touchUpInside
        )
    }
    
    private lazy var isSecureButton = UIButton().then {
        $0.setImage(hideIcon, for: .normal)
        $0.addTarget(
            self,
            action: #selector(tapIsSecureButton),
            for: .touchUpInside
        )
    }
    
    private lazy var moveSigninButton = UIButton().then {
        $0.setTitle("회원가입 하러가기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14.0)
        $0.setTitleColor(.loginDarkgray, for: .normal)
        $0.addTarget(
            self,
            action: #selector(moveToSignin),
            for: .touchUpInside
        )
    }
    
    private lazy var moveToPasswordResetButton = UIButton().then {
        $0.setTitle("비밀번호 재설정", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14.0)
        $0.setTitleColor(.loginDarkgray, for: .normal)
        $0.addTarget(
            self,
            action: #selector(moveToResetPassword),
            for: .touchUpInside
        )
    }
    
    private lazy var seperatorView = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x696B72)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupLayout()
        checkTextField()
        checkTextFieldInfo()
    }
}

// MARK: - Private

private extension LoginViewController {
    
    func setupNavigationBar() {
        navigationController?
            .navigationBar
            .prefersLargeTitles = true
        navigationController?
            .navigationBar
            .largeTitleTextAttributes = [.foregroundColor: UIColor.loginDarkgray]
        navigationItem.title = "로그인"
        
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self, action: nil
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupLayout() {
        let moveStackView = UIStackView(arrangedSubviews: [
            moveSigninButton,
            seperatorView,
            moveToPasswordResetButton
        ]).then {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 10.0
            
            seperatorView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.width.equalTo(1.0)
            }
        }
        
        [
            phoneNumberStackView,
            passwordStackView,
            isSecureButton,
            loginButton,
            moveStackView
        ].forEach { view.addSubview($0) }
        
        phoneNumberStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        passwordStackView.snp.makeConstraints {
            $0.top.equalTo(phoneNumberStackView.snp.bottom).offset(40.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        isSecureButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordStackView.textField)
            $0.trailing.equalTo(passwordStackView.textField.snp.trailing).offset(-16.0)
            $0.width.height.equalTo(24.0)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordStackView.snp.bottom).offset(66.0)
            $0.leading.trailing.equalToSuperview().inset(16.0)
            $0.height.equalTo(48.0)
        }
        
        moveStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(34.0)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(14.0)
        }
    }
    
    /// 텍스트 필드가 비어있으면 로그인 버튼 비활성화
    func checkTextField() {
        [
            phoneNumberStackView.textField,
            passwordStackView.textField
        ].forEach {
            $0.addAction(
                UIAction(handler: { [weak self] _ in
                    guard let self = self else { return }
                    
                    if self.phoneNumberStackView.textField.text?.isEmpty == true || self.passwordStackView.textField.text?.isEmpty == true {
                        
                        self.loginButton.isEnabled = false
                        self.loginButton.backgroundColor = UIColor(rgb: 0xD2D2D2)
                    } else {
                        self.loginButton.isEnabled = true
                        self.loginButton.backgroundColor = UIColor(rgb: 0x2358E1)
                    }
                }),
                for: .editingChanged
            )
        }
    }
    
    ///  텍스트필드가 형식이 맞지않으면(여기서는 비어있으면) 메세지 출력 ( 처음 실행했을때는 메세지 출력 x)
    func checkTextFieldInfo() {
        [
            phoneNumberStackView,
            passwordStackView
        ].forEach { stackView in
            stackView.textField.addAction(
                UIAction(handler: { _ in
                    if stackView.textField.text?.isEmpty == true {
                        stackView.addArrangedSubview(stackView.messageLabel)
                    } else {
                        stackView.removeArrangedSubview(stackView.messageLabel)
                        stackView.messageLabel.removeFromSuperview()
                    }
                }),
                for: .editingChanged
            )
        }
    }
    
    // MARK: - Selector
    
    @objc func moveToSignin() {
        let vc = SigninViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func moveToResetPassword() {
        let vc = ResetPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func moveToCompleteLogin() {
        let vc = CompleteLoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tapIsSecureButton() {
        isSecureButton.imageView?.image == hideIcon ?
        { [weak self] in
            self?.isSecureButton.setImage(self?.showIcon, for: .normal)
            self?.passwordStackView.textField.isSecureTextEntry.toggle()
        }()
        :
        {   [weak self] in
            self?.isSecureButton.setImage(self?.hideIcon, for: .normal)
            self?.passwordStackView.textField.isSecureTextEntry.toggle()
        }()
    }
}
