//
//  CreateNicknameViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/10/24.
//

import UIKit
import SnapKit
import Then

protocol SendNicknameData: AnyObject{
    func sendNicknameData(nickname: String)
}

class CreateNicknameViewController: UIViewController {
        
    // MARK: - Property
    
    private let viewModel = LoginViewModel()

    private let nicknameLable = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = .pretendardFont(weight: 500, size: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.setTextField(textColor: .black, backgroundColor:.gray2)
        $0.setPlaceholder(placeholder: "닉네임", fontColor: UIColor.black, font: .pretendardFont(weight: 600, size: 15))
        $0.addTarget(self, action: #selector(textFieldTapped), for: .allEvents)
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
    }
    
    private lazy var saveButton = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        $0.setButtonLayer(borderColor: .gray2)
        $0.addTarget(self, action: #selector(backToLoginVC), for: .touchUpInside)
        $0.isEnabled = false
    }
    
    weak var delegate: SendNicknameData?
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
    }
    
    // MARK: - View
    
    private func initBackground() {
        self.view.backgroundColor = .white
    }
    
    private func initViews() {
        self.view.addSubviews(nicknameLable, nicknameTextField, saveButton)
    }
    
    private func initConstraints() {
        nicknameLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(45)
            make.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLable.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
    
    @objc func textFieldTapped(_ textField: UITextField) {
        let isTextFieldsNotEmpty = viewModel.checkNicknameValid(nickname: nicknameTextField.text)
        
        //저장버튼 색깔 변경
        saveButton.isEnabled = isTextFieldsNotEmpty
        saveButton.backgroundColor = isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .white
        saveButton.setButtonLayer(borderColor: isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .gray2)

        if isTextFieldsNotEmpty {
            saveButton.setTitleColor(.white, for: .normal)
        } else {
            saveButton.setTitleColor(.gray2, for: .normal)
        }
    }
    
    @objc private func backToLoginVC() {
        guard let nicknameText = nicknameTextField.text else { return }
        delegate?.sendNicknameData(nickname: nicknameText)
        dismiss(animated: true)
    }
}
