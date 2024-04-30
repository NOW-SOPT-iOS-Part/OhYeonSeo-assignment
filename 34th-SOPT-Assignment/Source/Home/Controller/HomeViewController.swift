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
    
    //MARK: - Data
    
    private var mainData = MainModel.dummy() {
        didSet {
            self.mainContentCollectionView.reloadData()
        }
    }
    
    private var liveData = LiveModel.dummy() {
        didSet {
            self.popularLiveCollectionView.reloadData()
        }
    }
    
    private var advData = AdvModel.dummy() {
        didSet {
            self.advBannerCollectionView.reloadData()
        }
    }
    
    // MARK: - View
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let homeTopView = HomeTopView()        //Tving 로고 배너
    private let upperTabBar = HomeUpperTapBar()    //페이지 선택 탭 (홈, 실시간, TV프로그램, 영화, 파라마운트+)
    
    private let mainContentCollectionView = UICollectionView.setCollectionView()
    
    private let header1 = SubHeaderView().bindData(text: "티빙에서 꼭 봐야하는 콘텐츠")
    private let mustSeenCollectionView = UICollectionView.setCollectionView()
    
    private let header2 = SubHeaderView().bindData(text: "인기 LIVE 채널")
    private let popularLiveCollectionView = UICollectionView.setCollectionView()
    private let advBannerCollectionView = UICollectionView.setCollectionView()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackground()
        initViews()
        initConstraints()
        setNavigation()
        setDelegate()
        setRegister()
    }
    
    // MARK: - init functions
    
    private func initBackground() {
        self.view.backgroundColor = .black
    }
    
    private func initViews() {
        self.view.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(mainContentCollectionView,mustSeenCollectionView,
                                popularLiveCollectionView,advBannerCollectionView,
                                homeTopView, upperTabBar,
                                header1, header2)
    }
    
    private func initConstraints() {
        
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
    
    
    //MARK: - Methods
    
    private func setDelegate() {
        mainContentCollectionView.delegate = self
        mainContentCollectionView.dataSource = self
        mustSeenCollectionView.delegate = self
        mustSeenCollectionView.dataSource = self
        popularLiveCollectionView.delegate = self
        popularLiveCollectionView.dataSource = self
        advBannerCollectionView.delegate = self
        advBannerCollectionView.dataSource = self
    }
    
    private func setRegister() {
        mainContentCollectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "main")
        mustSeenCollectionView.register(SubViewCell1.self, forCellWithReuseIdentifier: "sub1")
        popularLiveCollectionView.register(SubViewCell2.self, forCellWithReuseIdentifier: "sub2")
        advBannerCollectionView.register(AdvBannerCell.self, forCellWithReuseIdentifier: "adv")
    }
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainContentCollectionView{
            return 4
        } else if collectionView == mustSeenCollectionView {
            return mainData.count
        } else if collectionView == popularLiveCollectionView {
            return liveData.count
        } else {
            return advData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == mainContentCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "main", for: indexPath) as? MainViewCell
            else { return UICollectionViewCell() }
            cell.dataBind(mainData[indexPath.item], itemRow: indexPath.item)
            return cell
        }
        else if collectionView == mustSeenCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sub1", for: indexPath) as? SubViewCell1
            else { return UICollectionViewCell() }
            cell.dataBind(mainData[indexPath.item], itemRow: indexPath.item)
            return cell
        }
        else if collectionView == popularLiveCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sub2", for: indexPath) as? SubViewCell2
            else { return UICollectionViewCell() }
            cell.dataBind(liveData[indexPath.item], itemRow: indexPath.item)
            return cell
        }
        else if collectionView == advBannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adv", for: indexPath) as? AdvBannerCell
            else { return UICollectionViewCell() }
            cell.dataBind(advData[indexPath.item], itemRow: indexPath.item)
            return cell
        }
        else {
            fatalError("Unexpected section \(indexPath.section)")
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mustSeenCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        } else if collectionView == popularLiveCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView === mainContentCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else if collectionView === mustSeenCollectionView {
            return CGSize(width: 100, height: 160)
        } else if collectionView === popularLiveCollectionView {
            return CGSize(width: collectionView.frame.width / 3 - 10, height: 120)
        } else if collectionView === advBannerCollectionView {
            return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
        }
        return CGSize(width: 50, height: 50)
    }
}
