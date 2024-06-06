//
//  HeaderModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit

struct HeaderModel {
    let title: String
    
    static func dummy() -> [HeaderModel] {
        return [
            HeaderModel(title: "티빙에서 꼭 봐야하는 콘텐츠"),
            HeaderModel(title: "인기 LIVE 채널"),
        ]
    }
}
