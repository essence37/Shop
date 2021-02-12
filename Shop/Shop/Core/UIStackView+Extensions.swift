//
//  UIStackView+Extensions.swift
//  Shop
//
//  Created by Пазин Даниил on 21.01.2021.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
