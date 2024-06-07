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
    var nickname: String? = ""
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    
    // MARK: - UIView
    
    private let loginView = LoginView()
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
        setDelegate()
        setAddTarget()
    }
    
    // MARK: - UI
    
    private func initBackground() {
        view.backgroundColor = .black
    }
    
    private func initViews() {
        self.view.addSubview(loginView)
    }
    
    private func initConstraints() {
        loginView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        loginView.idTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    private func setAddTarget() {
        loginView.idTextField.addTarget(self, action: #selector(textFieldTapped), for: .allEvents)
        loginView.idDeleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        loginView.passwordTextField.addTarget(self, action: #selector(textFieldTapped), for: .allEvents)
        loginView.passwordDeleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        loginView.passwordRevealedButton.addTarget(self, action: #selector(revealedButtonTapped), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        loginView.createNicknameButton.addTarget(self, action: #selector(presentCreateNicknameVC), for: .touchUpInside)
    }
    
    @objc private func presentCreateNicknameVC() {
        let VC = CreateNicknameViewController()
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium()]
           }
        VC.modalPresentationStyle = .formSheet
        VC.delegate = self
        self.present(VC, animated: true)
    }
    
    func checkEmail(str: String) -> Bool {
        return  NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: str)
    }
}

extension LoginViewController: SendNicknameData {
    func sendNicknameData(nickname: String) {
        self.nickname = nickname
    }
}

extension LoginViewController: UITextFieldDelegate {
    //id or nickname 전달
    @objc func loginButtonDidTap() {
        let viewController = WelcomeViewController()
        let id = (nickname == "") ? loginView.idTextField.text : nickname
       
        viewController.setLabelText(id: id)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            loginView.idTextField.text = ""
            loginView.idDeleteButton.isHidden = true
        }
        else {
            loginView.passwordTextField.text = ""
            loginView.passwordDeleteButton.isHidden = true
        }
        
        loginView.loginButton.isEnabled = false
        loginView.loginButton.backgroundColor = .black
        loginView.loginButton.setTitleColor(.gray3, for: .normal)
    }
    
    @objc func revealedButtonTapped(_ sender: UIButton) {
        if passwardRevealed {
            loginView.passwordRevealedButton.setImage(.eyeIcon, for: .normal)
            loginView.passwordTextField.isSecureTextEntry = false
        }
        else {
            loginView.passwordRevealedButton.setImage(.eyeslashIcon, for: .normal)
            loginView.passwordTextField.isSecureTextEntry = true
        }
        passwardRevealed = !passwardRevealed
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray4")?.cgColor
        loginView.idDeleteButton.isHidden = true
        loginView.passwordRevealedButton.isHidden = true
        loginView.passwordDeleteButton.isHidden = true
    }
    
    @objc func textFieldTapped(_ textField: UITextField) {
        let id = loginView.idTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        let isTextFieldsNotEmpty = !id.isEmpty && !password.isEmpty && checkEmail(str: id)
        
        //로그인버튼 색깔 변경
        loginView.loginButton.isEnabled = isTextFieldsNotEmpty
        loginView.loginButton.backgroundColor = isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .black
        if isTextFieldsNotEmpty {
            loginView.loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginView.loginButton.setTitleColor(.gray2, for: .normal)
        }
        
        //delete button
        if textField.tag == 100 {
            loginView.idDeleteButton.isHidden = id.isEmpty
            loginView.passwordRevealedButton.isHidden = true
            loginView.passwordDeleteButton.isHidden = true
        }
        if textField.tag == 200 {
            loginView.idDeleteButton.isHidden = true
            loginView.passwordDeleteButton.isHidden = password.isEmpty
            loginView.passwordRevealedButton.isHidden = false
        }
    }
}
