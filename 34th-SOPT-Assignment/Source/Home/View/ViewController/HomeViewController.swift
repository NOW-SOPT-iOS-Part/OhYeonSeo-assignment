//
//  HomeViewController.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/29/24.
//

import UIKit

import SnapKit
import Then
import RxSwift

final class HomeViewController: UIViewController {
    
    // MARK: - View
    
    private let rootView = HomeRootView()
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        initConstraints()
        setNavigation()
        setDelegate()
        setRegister()
        setCollectionView()
        bindViewModel()
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
    
    private func bindViewModel() {
        viewModel.mainData
            .subscribe(onNext: { [weak self] data in
                self?.rootView.mainContentCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.movieData
            .subscribe(onNext: { [weak self] data in
                self?.rootView.mustSeenCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.liveData
            .subscribe(onNext: { [weak self] data in
                self?.rootView.popularLiveCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.advData
            .subscribe(onNext: { [weak self] data in
                self?.rootView.advBannerCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.mainContentCollectionView:
            return (try? viewModel.mainData.value().count) ?? 0
        case rootView.mustSeenCollectionView:
            return (try? viewModel.movieData.value().count) ?? 0
        case rootView.popularLiveCollectionView:
            return (try? viewModel.liveData.value().count) ?? 0
        default:
            return (try? viewModel.advData.value().count) ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.mainContentCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCell.identifier, for: indexPath) as? MainViewCell,
                  let data = try? viewModel.mainData.value()[indexPath.item] else {
                return UICollectionViewCell()
            }
            cell.dataBind(data, itemRow: indexPath.item)
            return cell
        case rootView.mustSeenCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubViewCell1.identifier, for: indexPath) as? SubViewCell1,
                  let data = try? viewModel.movieData.value()[indexPath.item] else {
                return UICollectionViewCell()
            }
            cell.dataBind(movieImage: .movie1,
                          movieName: String(data.movieNm.prefix(9)),
                          audiAcc: data.audiAcc)
            return cell
        case rootView.popularLiveCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubViewCell2.identifier, for: indexPath) as? SubViewCell2,
                  let data = try? viewModel.liveData.value()[indexPath.item] else {
                return UICollectionViewCell()
            }
            cell.dataBind(data, itemRow: indexPath.item)
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvBannerCell.identifier, for: indexPath) as? AdvBannerCell,
                  let data = try? viewModel.advData.value()[indexPath.item] else {
                return UICollectionViewCell()
            }
            cell.dataBind(data, itemRow: indexPath.item)
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
