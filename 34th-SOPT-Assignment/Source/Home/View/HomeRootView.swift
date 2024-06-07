//
//  HomeRootView.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

import SnapKit
import Then

final class HomeRootView: UIView {
    
    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let homeTopView = HomeTopView()  

    private let upperTabBar = HomeUpperTapBar()
    
    let mainContentCollectionView = UICollectionView.setCollectionView()
    
    private let header1 = SubHeaderView().bindData(text: "티빙에서 꼭 봐야하는 콘텐츠")
    
    let mustSeenCollectionView = UICollectionView.setCollectionView()
    
    private let header2 = SubHeaderView().bindData(text: "인기 LIVE 채널")
    
    let popularLiveCollectionView = UICollectionView.setCollectionView()
    
    let advBannerCollectionView = UICollectionView.setCollectionView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupHierarchy()
        setupLayout()
    
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomeRootView {
    func setupStyle() {
        self.backgroundColor = .black

    }
    
    func setupHierarchy() {
        addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(mainContentCollectionView,mustSeenCollectionView,
                                popularLiveCollectionView,advBannerCollectionView,
                                homeTopView, upperTabBar,
                                header1, header2)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.width.equalTo(scrollView)
            $0.height.equalTo(2000)
        }
        
        homeTopView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        upperTabBar.snp.makeConstraints{
            $0.top.equalTo(homeTopView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        mainContentCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(530)
        }
        
        header1.snp.makeConstraints {
            $0.top.equalTo(mainContentCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        mustSeenCollectionView.snp.makeConstraints{
            $0.top.equalTo(header1.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        header2.snp.makeConstraints {
            $0.top.equalTo(mustSeenCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(10)
        }
        
        popularLiveCollectionView.snp.makeConstraints{
            $0.top.equalTo(header2.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        advBannerCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularLiveCollectionView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
}
