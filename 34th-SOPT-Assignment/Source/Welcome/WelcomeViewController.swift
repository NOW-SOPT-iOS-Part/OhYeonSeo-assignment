//
//  WelcomeViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    var id: String? = ""
    
    private let logoImage = UIImageView(image: UIImage(named: "Tving_logo"))
    
    private let welcomeLabel = UILabel().then {
        $0.font = .pretendardFont(weight: 700, size: 23)
        $0.textColor = UIColor(named: "gray1")
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    private lazy var mainButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "BrandColor")
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = .pretendardFont(weight: 600, size: 14)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.addTarget(self, action: #selector(mainButtontapped), for: .touchUpInside)
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
        bindID()
    }
    
    // MARK: - View
    
    private func initBackground() {
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func initViews() {
        self.view.addSubviews(logoImage, welcomeLabel, mainButton)
    }
    
    private func initConstraints() {
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.centerX.leading.trailing.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    @objc
    func mainButtontapped() {
        if let windowScene = view.window?.windowScene {
            for window in windowScene.windows {
                if window.isKeyWindow {
                    window.rootViewController = UINavigationController(rootViewController: TabBarViewController())
                }
            }
        }
    }
}
