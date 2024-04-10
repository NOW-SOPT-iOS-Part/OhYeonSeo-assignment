//
//  LoginViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    
    //MARK: - Property
    
    var passwardRevealed = true
    
    // MARK: - UIView
    
    private let loginLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .pretendardFont(weight: 500, size: 23)
        $0.textColor = UIColor(named: "gray1")
    }
    
    private lazy var idTextField = UITextField().then {
        $0.setTextField(textColor: UIColor(named: "gray2")!, backgroundColor: UIColor(named: "gray4")!)
        $0.setPlaceholder(placeholder: "아이디", fontColor: UIColor(named: "gray2")!, font: .pretendardFont(weight: 600, size: 15))
        $0.delegate = self
        $0.addTarget(self, action: #selector(textFieldTapped), for: .allEvents) //.editingChanged
        $0.tag = 100
    }
    
    private lazy var idDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "delete_icon"), for: .normal)
        $0.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        $0.isHidden = true
        $0.tag = 0
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.setTextField(textColor: UIColor(named: "gray2")!, backgroundColor: UIColor(named: "gray4")!)
        $0.setPlaceholder(placeholder: "비밀번호", fontColor: UIColor(named: "gray2")!, font: .pretendardFont(weight: 600, size: 15))
        $0.delegate = self
        $0.isSecureTextEntry = true
        $0.addTarget(self, action: #selector(textFieldTapped), for: .allEvents)
        $0.tag = 200
    }
    
    private lazy var passwordDeleteButton = UIButton().then {
        $0.setImage(UIImage(named: "delete_icon"), for: .normal)
        $0.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        $0.isHidden = true
        $0.tag = 1
    }
    
    private lazy var passwordRevealedButton = UIButton().then {
        $0.setImage(UIImage(named: "eyeslash_icon"), for: .normal)
        $0.addTarget(self, action: #selector(revealedButtonTapped), for: .touchUpInside)
        $0.isHidden = true
    }
    
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray2"), for: .normal)
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        $0.layer.borderColor = UIColor(named: "gray4")?.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.layer.cornerRadius = 3
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private let stackView1 = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 5
        $0.distribution = .equalSpacing
        $0.alignment = .center
    }
    
    private lazy var findIdButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray2"), for: .normal)
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
    }
    
    private lazy var findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray2"), for: .normal)
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
    }
    
    private let splitView = UIView().then {
        $0.backgroundColor = UIColor(named: "gray4")
    }
    
    private let noAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .pretendardFont(weight: 600, size: 14)
        $0.textColor = UIColor(named: "gray3")
    }
    
    private lazy var createNicknameButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.titleLabel?.font = .pretendardFont(weight: 400, size: 14)
        $0.titleLabel?.textColor = UIColor(named: "gray2")
        $0.setUnderline()
        $0.addTarget(self, action: #selector(presentCreateNicknameVC), for: .touchUpInside)
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
                              idDeleteButton, passwordDeleteButton, passwordRevealedButton,
                              loginButton,stackView1, noAccountLabel, createNicknameButton)
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
    
    @objc private func presentCreateNicknameVC() {
        let VC = CreateNicknameViewController()
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium()]
           }

        VC.modalPresentationStyle = .formSheet
        self.present(VC, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    @objc func loginButtonDidTap() {
        let VC = WelcomeViewController()
        VC.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            idTextField.text = ""
            idDeleteButton.isHidden = true
        }
        else {
            passwordTextField.text = ""
            passwordDeleteButton.isHidden = true
        }
        
        //로그인버튼 색깔 변경 - textfield를 터치하는게 아니기에..
        loginButton.isEnabled = false
        loginButton.backgroundColor = .black
        loginButton.setTitleColor(UIColor(named: "gray2"), for: .normal)
    }
    
    @objc func revealedButtonTapped(_ sender: UIButton) {
        if passwardRevealed {
            passwordRevealedButton.setImage(UIImage(named: "eye_icon"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
        else {
            passwordRevealedButton.setImage(UIImage(named: "eyeslash_icon"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
        passwardRevealed = !passwardRevealed
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray4")?.cgColor
        idDeleteButton.isHidden = true
        passwordRevealedButton.isHidden = true
        passwordDeleteButton.isHidden = true
    }
    
    @objc func textFieldTapped(_ textField: UITextField) {
        let id = idTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let isTextFieldsNotEmpty = !id.isEmpty && !password.isEmpty
        
        //로그인버튼 색깔 변경
        loginButton.isEnabled = isTextFieldsNotEmpty
        loginButton.backgroundColor = isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .black
        if isTextFieldsNotEmpty {
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginButton.setTitleColor(UIColor(named: "gray2"), for: .normal)
        }
        
        //delete button
        if textField.tag == 100 {
            idDeleteButton.isHidden = id.isEmpty
            passwordRevealedButton.isHidden = true
            passwordDeleteButton.isHidden = true
        }
        if textField.tag == 200 {
            idDeleteButton.isHidden = true
            passwordDeleteButton.isHidden = password.isEmpty
            passwordRevealedButton.isHidden = false
        }
    }
}

#Preview {
    LoginViewController()
}
