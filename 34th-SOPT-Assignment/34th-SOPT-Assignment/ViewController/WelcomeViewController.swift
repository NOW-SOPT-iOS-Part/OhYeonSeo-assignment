//
//  WelcomeViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit
import SnapKit
import Then

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    weak var idDelegate: DataBindProtocol?
    var id: String = ""
    
//    private lazy var iconImage = UIImage().then {
//        //$0.cgImage =
//    }
    
    private lazy var welcomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20)
    }
    
    private lazy var mainButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "SymbolColor")
        $0.titleLabel?.text = "메인으로"
        $0.titleLabel?.textColor = .white
    }
    
    // MARK: - View
    private func bindID() {
        self.welcomeLabel.text = "\(id) 님 \n반가워요!"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        initViews()
        initConstraints()
    }
    
    private func initViews() {
        //self.view.addSubviews(iconImage, welcomeLabel, mainButton)
    }
    
    private func initConstraints() {
        
    }
    
}
