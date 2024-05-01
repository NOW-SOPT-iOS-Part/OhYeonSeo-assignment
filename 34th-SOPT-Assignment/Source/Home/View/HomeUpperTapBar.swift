//
//  HomeUpperTapBar.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

final class HomeUpperTapBar: UIView {
    
    // MARK: - Property
    
    private let homeButton = UIButton().then{
        $0.setTitle("홈", for: .normal)
    }
    
    private let liveButton = UIButton().then{
        $0.setTitle("라이브", for: .normal)
    }
    
    private let tvButton = UIButton().then{
        $0.setTitle("TV프로그램", for: .normal)
    }
    
    private let movieButton = UIButton().then{
        $0.setTitle("영화", for: .normal)
    }
    
    private let paramountButton = UIButton().then{
        $0.setTitle("파라마운트+", for: .normal)
    }
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [homeButton,
                           liveButton,
                           tvButton,
                           movieButton,
                           paramountButton])
        .then{
            $0.axis = .horizontal
            $0.spacing = 20
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
        addSubviews(stackView)
    }
    
    private func initConstraints() {
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
    }
}
