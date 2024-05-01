//
//  UIStackView+.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 4/8/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
                self.addArrangedSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
