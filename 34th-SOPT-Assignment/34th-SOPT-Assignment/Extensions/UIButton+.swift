//
//  UIButton+.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,  //underline 속성 추가
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    //UIButton 기본 속성 커스텀
    func setButtonLayer(borderColor: UIColor?) {
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.layer.borderColor = borderColor?.cgColor
    }
    
}
