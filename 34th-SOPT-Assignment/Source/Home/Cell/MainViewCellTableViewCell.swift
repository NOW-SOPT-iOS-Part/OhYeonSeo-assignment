//
//  MainViewCellTableViewCell.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class MainViewCell: UICollectionViewCell {
    
    static let identifier = "main"
    var itemRow: Int?

    
    //MARK: - UIViews
    
    private let moviePoster = UIImageView().then {
        $0.image = .movie1
    }
    
    private let movieName = UILabel().then {
        $0.text = "제목"
        $0.font = .pretendardFont(weight: 700, size: 25)
        $0.textColor = .white
    }
    
    private let movieDescription = UILabel().then {
        $0.text = "내용"
        $0.font = .pretendardFont(weight: 500, size: 14)
        $0.textColor = .white
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
        addSubviews(moviePoster, movieName, movieDescription)
    }
    
    private func initConstraints() {
        moviePoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        movieName.snp.makeConstraints {
            $0.top.equalTo(moviePoster.snp.top).inset(400)
            $0.leading.equalTo(moviePoster.snp.leading).inset(20)
        }
        
        movieDescription.snp.makeConstraints{
            $0.top.equalTo(movieName.snp.bottom).offset(5)
            $0.leading.equalTo(movieName)
        }
    }
    
    func bindData(image: UIImage, name: String, description: String) {
        self.moviePoster.image = image
        self.movieName.text = name
        self.movieDescription.text = description
    }
}

extension MainViewCell {
    func dataBind(_ mainData: MainModel, itemRow: Int) {
        moviePoster.image = mainData.itemImg
        movieName.text = mainData.title
        movieDescription.text = mainData.description
        self.itemRow = itemRow
    }
}
