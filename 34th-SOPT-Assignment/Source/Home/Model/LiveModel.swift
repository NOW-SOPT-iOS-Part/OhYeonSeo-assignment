//
//  LiveModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit

struct LiveModel {
    let thumbnail: UIImage
    let channelNumber: String
    let channelTitle: String
    let channelEpisode: String
    let channelPercent: String
    
    static func dummy() -> [LiveModel] {
        return [
            LiveModel(thumbnail: .thumbnail, channelNumber: "1", channelTitle: "핱시", channelEpisode: "12화", channelPercent: "80%"),
            LiveModel(thumbnail: .thumbnail, channelNumber: "2", channelTitle: "환연", channelEpisode: "1화", channelPercent: "20%"),
            LiveModel(thumbnail: .thumbnail, channelNumber: "3", channelTitle: "솔지", channelEpisode: "6화", channelPercent: "30%"),
            LiveModel(thumbnail: .thumbnail, channelNumber: "4", channelTitle: "나솔", channelEpisode: "7화", channelPercent: "60%"),

        ]
    }
}
