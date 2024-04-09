//
//  LoginViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit
import SnapKit
import Then

protocol SendEmailProtocol: AnyObject {
    func loginDidSucceed(email: String?)
}

class LoginViewController: UIViewController {
    
    //MARK: - Property
    
    weak var emailDelegate: SendEmailProtocol?
    
    // MARK: - UIView
    
    private lazy var loginLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .systemFont(ofSize: 25)
        $0.textColor = .white
    }
    
    private lazy var idTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        $0.textColor = .white
        $0.backgroundColor = UIColor(named: "MainGray")
        $0.layer.borderColor = UIColor(named: "MainGray")?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.delegate = self
        $0.addPadding(left: 20)
        $0.clearButtonMode = .whileEditing
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private lazy var idCancelButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark.circle"), for: .application)
    }
    
    //eye
    //eye.slash
    
    private lazy var passwordTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        $0.textColor = .white
        $0.backgroundColor = UIColor(named: "MainGray")
        $0.layer.borderColor = UIColor(named: "MainGray")?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.delegate = self
        $0.addPadding(left: 20)
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .allEvents)

    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.layer.borderColor = UIColor(named: "MainGray")?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.layer.cornerRadius = 3
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var stackView1 = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .equalSpacing
        $0.alignment = .center
    }
    
    private lazy var findIdButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.titleLabel?.textColor = UIColor(named: "LightGray")
    }
    
    private lazy var findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.titleLabel?.textColor = UIColor(named: "LightGray")
    }
    
    private lazy var splitView = UIView().then {
        $0.backgroundColor = UIColor(named: "LightGray")
    }
    
    private lazy var noAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .systemFont(ofSize: 15)
        $0.textColor = UIColor(named: "ActiveGray")
    }
    
    private lazy var signUpButton = UIButton().then {
        $0.setTitle("TVING ID 회원가입하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.titleLabel?.textColor = UIColor(named: "LightGray")
        $0.setUnderline()
    }
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
        }
    
    // MARK: - UI
    
    private func initBackground() {
        view.backgroundColor = .black
    }
    
    private func initViews() {
        self.view.addSubviews(loginLabel, idTextField, passwordTextField,
                              loginButton,stackView1, noAccountLabel, signUpButton)
        stackView1.addArrangedSubviews(findIdButton, splitView, findPasswordButton)
    }
    
    private func initConstraints() {
        
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
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(60)
            make.height.equalTo(55)
        }
        
        splitView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(1)
        }
        
        noAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(findIdButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(40)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(noAccountLabel)
            make.leading.equalTo(noAccountLabel.snp.trailing).offset(10)
        }
    }
    
    @objc func loginButtonDidTap() {
        let VC = WelcomeViewController()
        emailDelegate?.loginDidSucceed(email: self.idTextField.text)
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "LightGray")?.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "MainGray")?.cgColor
    }
    
    @objc func textFieldDidChange() {
        let isTextFieldsNotEmpty = !(idTextField.text?.isEmpty ?? true)
                                && !(passwordTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = isTextFieldsNotEmpty
        loginButton.backgroundColor = isTextFieldsNotEmpty ? UIColor(named: "SymbolColor") : .black
    }
}
