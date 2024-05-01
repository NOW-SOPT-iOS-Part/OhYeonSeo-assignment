//
//  UITextField+.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit

extension UITextField {
    
    /// 텍스트필드 안쪽에 패딩 추가
    /// - Parameter left: 왼쪽에 추가할 패딩 너비
    /// - Parameter right: 오른쪽에 추가할 패딩 너비
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
    
    //TextField 기본 속성 커스텀
    func setTextField(textColor: UIColor?, backgroundColor: UIColor?) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    
    //TextField placeholder 커스텀
    func setPlaceholder(placeholder: String, fontColor: UIColor?, font: UIFont) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [.foregroundColor: fontColor!,
                                                                     .font: font])
        self.addPadding(left: 22)

    }
}
