//
//  CatalogCell.swift
//  Shop
//
//  Created by Пазин Даниил on 26.01.2021.
//

import UIKit

class CatalogCell: UICollectionViewCell {
    
    private lazy var productImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var productName: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productPrice: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var product: Product? {
      didSet {
        if let product = product {
            productName.text = product.name
            productPrice.text = String("\(product.price) руб.")
        }
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubviews(productImage, productName, productPrice)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        //add code here to layout views
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: productName.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            productName.bottomAnchor.constraint(equalTo: productPrice.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            productPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
