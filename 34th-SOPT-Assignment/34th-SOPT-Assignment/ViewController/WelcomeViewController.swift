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
    var email: String? = ""
    
//    private lazy var iconImage = UIImage().then {
//        //$0.cgImage =
//    }
    
    private lazy var welcomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    private lazy var mainButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "BrandColor")
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 3
        $0.layer.cornerRadius = 3
        $0.isEnabled = false
    }
    
    // MARK: - View
//    private func pushToWelcomeVC {
//        let VC = LoginViewController()
//        VC.idDelegate = self
//    }
    
    func setLabelText(email: String?) {
            self.email = email
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        initViews()
        initConstraints()
    
        LoginViewController().emailDelegate = self
    }
    
    private func initViews() {
        self.view.addSubviews(welcomeLabel, mainButton)
    }
    
    private func initConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(120)
            make.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(55)
        }
    }
}

extension WelcomeViewController: SendEmailProtocol {
    func loginDidSucceed(email: String?) {
        self.welcomeLabel.text = "\(email ?? "연서") 님 \n반가워요!"
    }
}

//#Preview {
//    WelcomeViewController()
//}
