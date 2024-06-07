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
            rootView.mainContentCollectionView.reloadData()
        }
    }
    
    private var movieData: [DailyBoxOfficeList] = []
    
    private var liveData = LiveModel.dummy() {
        didSet {
            rootView.popularLiveCollectionView.reloadData()
        }
    }
    
    private var advData = AdvModel.dummy() {
        didSet {
            rootView.advBannerCollectionView.reloadData()
        }
    }
        
    // MARK: - View
    
    private let rootView = HomeRootView()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        initConstraints()
        setNavigation()
        setDelegate()
        setRegister()
        setCollectionView()
        fetchData()
    }
    
    // MARK: - init functions

    private func initViews() {
        self.view.addSubview(rootView)
    }
    
    private func initConstraints() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    //MARK: - Methods
    
    private func setDelegate() {
        rootView.mainContentCollectionView.delegate = self
        rootView.mainContentCollectionView.dataSource = self
        rootView.mustSeenCollectionView.delegate = self
        rootView.mustSeenCollectionView.dataSource = self
        rootView.popularLiveCollectionView.delegate = self
        rootView.popularLiveCollectionView.dataSource = self
        rootView.advBannerCollectionView.delegate = self
        rootView.advBannerCollectionView.dataSource = self
    }
    
    private func setRegister() {
        rootView.mainContentCollectionView.register(MainViewCell.self, forCellWithReuseIdentifier: MainViewCell.identifier)
        rootView.mustSeenCollectionView.register(SubViewCell1.self, forCellWithReuseIdentifier: SubViewCell1.identifier)
        rootView.popularLiveCollectionView.register(SubViewCell2.self, forCellWithReuseIdentifier: SubViewCell2.identifier)
        rootView.advBannerCollectionView.register(AdvBannerCell.self, forCellWithReuseIdentifier: AdvBannerCell.identifier)
    }
    
    private func setNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setCollectionView() {
        rootView.mainContentCollectionView.isPagingEnabled = true
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.mainContentCollectionView:
            return 4
        case rootView.mustSeenCollectionView:
            return movieData.count
        case rootView.popularLiveCollectionView:
            return liveData.count
        default:
            return advData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.mainContentCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCell.identifier, for: indexPath) as? MainViewCell
            else { return UICollectionViewCell() }
            cell.dataBind(mainData[indexPath.item], itemRow: indexPath.item)
            return cell
        case rootView.mustSeenCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubViewCell1.identifier, for: indexPath) as? SubViewCell1
            else { return UICollectionViewCell() }
            cell.dataBind(movieImage: .movie1, movieName: String(movieData[indexPath.row].movieNm.prefix(9)), audiAcc: movieData[indexPath.row].audiAcc)
            return cell
        case rootView.popularLiveCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubViewCell2.identifier, for: indexPath) as? SubViewCell2
            else { return UICollectionViewCell() }
            cell.dataBind(liveData[indexPath.item], itemRow: indexPath.item)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvBannerCell.identifier, for: indexPath) as? AdvBannerCell
            else { return UICollectionViewCell() }
            cell.dataBind(advData[indexPath.item], itemRow: indexPath.item)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         switch collectionView {
         case rootView.mustSeenCollectionView:
             return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
         case rootView.popularLiveCollectionView:
             return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
         default:
             return UIEdgeInsets.zero
         }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case rootView.mainContentCollectionView:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        case rootView.mustSeenCollectionView:
            return CGSize(width: 100, height: 160)
        case rootView.popularLiveCollectionView:
            return CGSize(width: collectionView.frame.width / 3 - 10, height: 120)
        default:
            return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
        }
    }
}

extension HomeViewController {
     private func fetchData() {
         MovieService.shared.fetchMovieChart(date: "20240509") { [weak self] response in
             switch response {
             case.success(let data):
                 guard let data = data as? MovieResponseModel else { return }
                 self?.movieData.append(contentsOf: data.boxOfficeResult.dailyBoxOfficeList)
                 self?.rootView.mustSeenCollectionView.reloadData()
             case .requestErr:
                 print("요청 오류 입니다")
                 fatalError()
             case .decodedErr:
                 print("디코딩 오류 입니다")
             case .pathErr:
                 print("경로 오류 입니다")
             case .serverErr:
                 print("서버 오류입니다")
             case .networkFail:
                 print("네트워크 오류입니다")
             }
         }
     }
 }
