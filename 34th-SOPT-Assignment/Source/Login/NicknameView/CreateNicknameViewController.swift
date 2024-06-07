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
    
    private let rootView = NicknameView()
    
    private let viewModel = LoginViewModel()
    
    weak var delegate: SendNicknameData?
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
        setAddTarget()
    }
    
    // MARK: - View
    
    private func initBackground() {
        self.view.backgroundColor = .white
    }
    
    private func initViews() {
        self.view.addSubview(rootView)
    }
    
    private func initConstraints() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        rootView.nicknameTextField.addTarget(self, action: #selector(textFieldTapped), for: .allEvents)
        rootView.saveButton.addTarget(self, action: #selector(backToLoginVC), for: .touchUpInside)
    }
    
    @objc func textFieldTapped(_ textField: UITextField) {
        let textField = rootView.nicknameTextField.text
        let isTextFieldsNotEmpty = viewModel.checkNicknameValid(nickname: textField)
        
        //저장버튼 색깔 변경
        rootView.saveButton.isEnabled = isTextFieldsNotEmpty
        rootView.saveButton.backgroundColor = isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .white
        rootView.saveButton.setButtonLayer(borderColor: isTextFieldsNotEmpty ? UIColor(named: "BrandColor") : .gray2)

        if isTextFieldsNotEmpty {
            rootView.saveButton.setTitleColor(.white, for: .normal)
        } else {
            rootView.saveButton.setTitleColor(.gray2, for: .normal)
        }
    }
    
    @objc private func backToLoginVC() {
        guard let nicknameText = rootView.nicknameTextField.text else { return }
        delegate?.sendNicknameData(nickname: nicknameText)
        dismiss(animated: true)
    }
}
