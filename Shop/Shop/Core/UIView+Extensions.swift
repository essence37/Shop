//
//  UIView+Extensions.swift
//  Shop
//
//  Created by Пазин Даниил on 20.01.2021.
//

import UIKit

public extension UIView {
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
}
