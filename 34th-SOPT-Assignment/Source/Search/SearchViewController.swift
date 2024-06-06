//
//  SearchViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class SearchViewController: UIViewController {
    
    // MARK: - View
    
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
    }
    
    // MARK: - init functions
    
    private func initBackground() {
        self.view.backgroundColor = .systemPink
    }
    
    private func initViews() {
    }
    
    private func initConstraints() {
    }
}
