//
//  NicknameView.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

import SnapKit
import Then

final class NicknameView: UIView {
    
    // MARK: - UI Components
    
    private let nicknameLabel = UILabel()
    
    lazy var nicknameTextField = UITextField()
    
    lazy var saveButton = UIButton()
    
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

private extension NicknameView {
    func setupStyle() {
        nicknameLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = .pretendardFont(weight: 500, size: 23)
        }
        
        nicknameTextField.do {
            $0.setTextField(textColor: .black, backgroundColor:.gray2)
            $0.setPlaceholder(placeholder: "닉네임", fontColor: UIColor.black, font: .pretendardFont(weight: 600, size: 15))
            $0.layer.borderColor = UIColor(named: "gray2")?.cgColor
        }
        
        saveButton.do {
            $0.backgroundColor = .white
            $0.setTitle("저장하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
            $0.setButtonLayer(borderColor: .gray2)
            $0.isEnabled = false
        }
    }
    
    func setupHierarchy() {
        self.addSubviews(nicknameLabel, nicknameTextField, saveButton)
    }
    
    func setupLayout() {
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(45)
            make.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
        
        saveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
}
