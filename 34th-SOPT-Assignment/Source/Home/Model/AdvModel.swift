//
//  AdvModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/30/24.
//

import UIKit

struct AdvModel {
    let advImage: UIImage
    
    static func dummy() -> [AdvModel] {
        return [
            AdvModel(advImage: .advBanner),
            AdvModel(advImage: .advBanner),
        ]
    }
}
