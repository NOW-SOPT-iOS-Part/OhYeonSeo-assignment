//
//  SubViewCell2.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class SubViewCell2: UICollectionViewCell {
    
    static let identifier = "sub2"
    var itemRow: Int?

    
    //MARK: - UIViews
    
    private let thumbnailView = UIImageView().then {
        $0.image = .thumbnail
    }
    
    private let channelNumber = UILabel().then {
        $0.text = "1"
        $0.font = .pretendardFont(weight: 700, size: 19)
        $0.textColor = .white
    }
    
    private let channelTitle = UILabel().then {
        $0.text = "제목"
        $0.font = .pretendardFont(weight: 400, size: 10)
        $0.textColor = .white
    }
    
    private let channelEpisode = UILabel().then {
        $0.text = "n화"
        $0.font = .pretendardFont(weight: 400, size: 10)
        $0.textColor = .gray1
    }
    
    private let channelPercent = UILabel().then {
        $0.text = "퍼센트"
        $0.font = .pretendardFont(weight: 400, size: 10)
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
        addSubviews(thumbnailView, channelNumber, channelTitle, channelEpisode, channelPercent)
    }
    
    private func initConstraints() {
        thumbnailView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        channelNumber.snp.makeConstraints{
            $0.top.equalTo(thumbnailView.snp.bottom).offset(10)
            $0.leading.equalTo(thumbnailView.snp.leading).offset(6)
        }
        
        channelTitle.snp.makeConstraints{
            $0.top.equalTo(channelNumber)
            $0.leading.equalTo(channelNumber.snp.trailing).offset(2)
        }
        
        channelEpisode.snp.makeConstraints{
            $0.top.equalTo(channelTitle.snp.bottom).offset(2)
            $0.leading.equalTo(channelNumber.snp.trailing).offset(2)
        }
        
        channelPercent.snp.makeConstraints{
            $0.top.equalTo(channelEpisode.snp.bottom).offset(2)
            $0.leading.equalTo(channelNumber.snp.trailing).offset(2)
        }
    }
    
    func bindData(image: UIImage, number: String, title: String, episode: String, percent: String) {
        self.thumbnailView.image = image
        self.channelNumber.text = number
        self.channelTitle.text = title
        self.channelEpisode.text = episode
        self.channelPercent.text = percent
    }
}

extension SubViewCell2 {
    func dataBind(_ liveData: LiveModel, itemRow: Int) {
        self.thumbnailView.image = liveData.thumbnail
        self.channelNumber.text = liveData.channelNumber
        self.channelTitle.text = liveData.channelTitle
        self.channelEpisode.text = liveData.channelEpisode
        self.channelPercent.text = liveData.channelPercent
        self.itemRow = itemRow
    }
}
