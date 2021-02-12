//
//  BasketCell.swift
//  Shop
//
//  Created by Пазин Даниил on 31.01.2021.
//

import UIKit

class BasketCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
