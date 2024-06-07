//
//  LoginView.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - UI Components
    
    private let loginLabel = UILabel()
    
    lazy var idTextField = UITextField()
    
    lazy var idDeleteButton = UIButton()
    
    lazy var passwordTextField = UITextField()
    
    lazy var passwordDeleteButton = UIButton()
    
    lazy var passwordRevealedButton = UIButton()
    
    lazy var loginButton = UIButton()
    
    private let stackView1 = UIStackView()
    
    lazy var findIdButton = UIButton()
    
    lazy var findPasswordButton = UIButton()
    
    private let splitView = UIView()
    
    private let noAccountLabel = UILabel()
    
    lazy var createNicknameButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension LoginView {
    func setupStyle() {
        loginLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = .pretendardFont(weight: 500, size: 23)
            $0.textColor = .gray1
        }
        
        idTextField.do {
            $0.setTextField(textColor: .gray2, backgroundColor: .gray4)
            $0.setPlaceholder(placeholder: "아이디", fontColor: .gray2, font: .pretendardFont(weight: 600, size: 15))
            $0.tag = 100
        }
        
        idDeleteButton.do {
            $0.setImage(.deleteIcon, for: .normal)
            $0.isHidden = true
            $0.tag = 0
        }
        
        passwordTextField.do {
            $0.setTextField(textColor: .gray2, backgroundColor: .gray4)
            $0.setPlaceholder(placeholder: "비밀번호", fontColor: .gray2, font: .pretendardFont(weight: 600, size: 15))
            $0.isSecureTextEntry = true
            $0.tag = 200
        }
        
        passwordDeleteButton.do {
            $0.setImage(.deleteIcon, for: .normal)
            $0.isHidden = true
            $0.tag = 1
        }
        
        passwordRevealedButton.do {
            $0.setImage(.eyeslashIcon, for: .normal)
            $0.isHidden = true
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
            $0.setButtonLayer(borderColor: .gray4)
            $0.isEnabled = false
        }
        
        stackView1.do {
            $0.axis = .horizontal
            $0.spacing = 5
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        findIdButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        }
        
        findPasswordButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        }
        
        splitView.do {
            $0.backgroundColor = .gray4
        }
        
        noAccountLabel.do {
            $0.text = "아직 계정이 없으신가요?"
            $0.font = .pretendardFont(weight: 600, size: 14)
            $0.textColor = .gray3
        }
        
        createNicknameButton.do {
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 400, size: 14)
            $0.titleLabel?.textColor = .gray3
            $0.setUnderline()
        }
    }
    
    func setupHierarchy() {
        addSubviews(loginLabel, idTextField, passwordTextField,
                    idDeleteButton, passwordDeleteButton, passwordRevealedButton,
                    loginButton,stackView1, noAccountLabel, createNicknameButton)
        stackView1.addArrangedSubviews(findIdButton, splitView, findPasswordButton)
    }
    
    func setupLayout() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        idDeleteButton.snp.makeConstraints { make in
            make.trailing.equalTo(idTextField.snp.trailing).offset(-20)
            make.centerY.equalTo(idTextField)
            make.size.equalTo(20)
        }
        
        passwordDeleteButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordRevealedButton.snp.leading).offset(-10)
            make.centerY.equalTo(passwordTextField)
            make.size.equalTo(20)
        }
        
        passwordRevealedButton.snp.makeConstraints { make in
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
            make.centerY.equalTo(passwordTextField)
            make.size.equalTo(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(80)
            make.height.equalTo(55)
        }
        
        splitView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(1)
        }
        
        noAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(findIdButton.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(50)
        }
        
        createNicknameButton.snp.makeConstraints { make in
            make.centerY.equalTo(noAccountLabel)
            make.leading.equalTo(noAccountLabel.snp.trailing).offset(35)
        }
    }
}
