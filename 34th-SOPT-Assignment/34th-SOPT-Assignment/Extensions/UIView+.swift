//
//  UIView+.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit

extension UIView {
        func addSubviews(_ views: UIView...) {
                views.forEach {
                        self.addSubview($0)
                        $0.translatesAutoresizingMaskIntoConstraints = false
                }
        }
}
