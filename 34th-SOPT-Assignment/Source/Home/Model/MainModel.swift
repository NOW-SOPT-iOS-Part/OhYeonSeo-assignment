//
//  MainModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit

struct MainModel {
    let itemImg: UIImage
    let title: String
    let description: String
}

extension MainModel {
    static func dummy() -> [MainModel] {
        return [
            MainModel(itemImg: .movie1, title: "베트맨 비긴즈1", description: "재밌다"),
            MainModel(itemImg: .movie2, title: "다크나이트", description: "재밌네"),
            MainModel(itemImg: .movie3, title: "다크나이트 라이즈", description: "재밌어"),
            MainModel(itemImg: .movie1, title: "후속편 나와라~", description: "재밌음"),
            MainModel(itemImg: .movie1, title: "베트맨 비긴즈1", description: "재밌다"),
            MainModel(itemImg: .movie2, title: "다크나이트", description: "재밌네"),
            MainModel(itemImg: .movie3, title: "다크나이트 라이즈", description: "재밌어"),
            MainModel(itemImg: .movie1, title: "후속편 나와라~", description: "재밌음"),
        ]
    }
}
