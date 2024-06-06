//
//  MovieTargetType.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 5/10/24.
//

import Foundation

import Moya

enum MovieTargetType {
    case getMovieInfo(date: String)
}

extension MovieTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getMovieInfo:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getMovieInfo:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getMovieInfo(let date):
            let parameters: [String: Any] = [
                "key": Config.key,
                "targetDt": date
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
