//
//  HomeViewModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

import RxSwift


final class HomeViewModel {
    
    let mainData = BehaviorSubject <[MainModel]> (value: MainModel.dummy())
    let movieData = BehaviorSubject <[DailyBoxOfficeList]> (value: [])
    let liveData = BehaviorSubject <[LiveModel]> (value: LiveModel.dummy())
    let advData = BehaviorSubject <[AdvModel]> (value: AdvModel.dummy())
    
    init() {
        fetchMovieData()
    }
    
    private func fetchMovieData() {
        MovieService.shared.fetchMovieChart(date: "20240509") { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieResponseModel else { return }
                self?.movieData.onNext(data.boxOfficeResult.dailyBoxOfficeList)
            case .requestErr:
                print("요청 오류입니다")
            case .decodedErr:
                print("디코딩 오류입니다")
            case .pathErr:
                print("경로 오류입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
}

