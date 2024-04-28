//
//  HomeViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/29/24.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    // MARK: - Property
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
    }
    
    // MARK: - init functions
    
    private func initBackground() {
        self.view.backgroundColor = .black
    }
    
    private func initViews() {
        self.view.addSubviews()
    }
    
    private func initConstraints() {

    }

}
