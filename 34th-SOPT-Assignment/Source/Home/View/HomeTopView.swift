//
//  HomeTopView.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/29/24.
//

import UIKit
import SnapKit
import Then

final class HomeTopView: UIView {
    
    // MARK: - Property
    private let logoImage = UIImageView(image: .tvingLogo2)

    private let profileButton = UIButton().then {
        $0.setImage(UIImage(named: "profile_image"), for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.addTarget(HomeTopView.self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    private lazy var topStackView = UIStackView(
        arrangedSubviews: [logoImage,
                           profileButton]
    ).then {
        $0.axis = .horizontal
        $0.spacing = 220
        $0.alignment = .center
    }
    
    //MARK: - Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initBackground()
        initViews()
        initConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
    
    //MARK: - init functions
    
    private func initBackground() {
        backgroundColor = .clear
    }
    
    private func initViews() {
        addSubviews(topStackView)
    }
    
    private func initConstraints() {
        
        logoImage.snp.makeConstraints{
            $0.height.equalTo(25)
            $0.width.equalTo(100)
        }

        profileButton.snp.makeConstraints{
            $0.height.width.equalTo(30)
        }
        
        topStackView.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    @objc private func profileButtonTapped() {
        //FIX: mypage viewcontroller 구현
    }
}
