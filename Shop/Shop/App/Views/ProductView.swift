//
//  ProductView.swift
//  Shop
//
//  Created by Пазин Даниил on 28.01.2021.
//

import UIKit

final class ProductView: UIView {
    
    var addToBasketButtonTapped: (() -> Void)?

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
    
    private lazy var addToBasketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add to basket ", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self,
                         action: #selector(addToBasket),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubviews(productImage, productName, productPrice, addToBasketButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: self.topAnchor),
            productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImage.bottomAnchor.constraint(equalTo: addToBasketButton.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            addToBasketButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addToBasketButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            productName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: productName.bottomAnchor),
            productPrice.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            productPrice.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10)
        ])
    }
    
    @objc private func addToBasket() {
        addToBasketButtonTapped?()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
