//
//  SubViewCell1.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class SubViewCell1: UICollectionViewCell {
    
    static let identifier = "sub1"
    var itemRow: Int?

    
    //MARK: - UIViews
    
    private let moviePoster = UIImageView().then {
        $0.image = .movie1
    }
    
    private let movieName = UILabel().then {
        $0.text = "제목"
        $0.font = .pretendardFont(weight: 500, size: 10)
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
        addSubviews(moviePoster, movieName)
    }
    
    private func initConstraints() {
        moviePoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        movieName.snp.makeConstraints {
            $0.top.equalTo(moviePoster.snp.bottom).offset(3)
            $0.leading.equalTo(moviePoster.snp.leading).inset(10)
        }
    }
}

extension SubViewCell1 {
    func dataBind(_ mainData: MainModel, itemRow: Int) {
        moviePoster.image = mainData.itemImg
        movieName.text = mainData.title
        self.itemRow = itemRow
    }
}

