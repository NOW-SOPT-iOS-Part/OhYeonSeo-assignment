//
//  AdvBannerCell.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit
import SnapKit
import Then

class AdvBannerCell: UICollectionViewCell {
    
    static let identifier = "AdvBannerCell"
    var itemRow: Int?

    
    //MARK: - UIViews
    
    private let advBanner = UIImageView().then {
        $0.image = UIImage(named: "adv_banner")
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
        addSubviews(advBanner)
    }
    
    private func initConstraints() {
        advBanner.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension AdvBannerCell {
    func dataBind(_ liveData: AdvModel, itemRow: Int) {
        self.advBanner.image = liveData.advImage
        self.itemRow = itemRow
    }
}
