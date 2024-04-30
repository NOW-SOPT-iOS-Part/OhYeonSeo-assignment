//
//  SubHeaderView.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class SubHeaderView: UICollectionReusableView {
    
    static let identifier = "header"
    
    //MARK: - UIViews
    
    private let titleLabel = UILabel().then {
        $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
        $0.font = .pretendardFont(weight: 600, size: 18)
        $0.textColor = .white
    }
    
    private let moveLabel = UILabel().then {
        $0.text = "전체보기 >"
        $0.font = .pretendardFont(weight: 500, size: 13)
        $0.textColor = .gray1
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initViews() {
        addSubviews(titleLabel, moveLabel)
    }
    
    private func initConstraints() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().inset(15)
        }
        
        moveLabel.snp.makeConstraints{
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}

extension SubHeaderView {
    func bindData(text: String) -> SubHeaderView {
        let view = SubHeaderView()
        view.titleLabel.text = text
        return view
    }
}
