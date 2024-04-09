//
//  CreateNicknameViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/10/24.
//

import UIKit
import SnapKit
import Then

class CreateNicknameViewController: UIViewController {
    
    // MARK: - Property

    private let nicknameLable = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.font = .pretendardFont(weight: 500, size: 23)
    }
    
    private lazy var nicknameTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(
            string: "닉네임",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        $0.font = .pretendardFont(weight: 600, size: 15)
        $0.backgroundColor = UIColor(named: "gray2")
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        $0.addPadding(left: 22)
    }
    
    private lazy var saveButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "BrandColor")
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.layer.borderColor = UIColor(named: "BrandColor")?.cgColor
        $0.addTarget(self, action: #selector(backToLoginVC), for: .touchUpInside)
    }
    
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
    
    @objc private func backToLoginVC() {
        //FIX - 닉네임 전달 로직
    }
}
