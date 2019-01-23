//
//  ProductCell.swift
//  shoppingAccessories
//
//  Created by chihhao on 2019-01-21.
//  Copyright © 2019 ChihHao. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 15
        return view
    }()
    
    let productImage: UIImageView = {
        let iv = UIImageView()
        //iv.backgroundColor = UIColor.red
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 15
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    let priceLabel: UILabel = {
        let price = UILabel()
        //price.backgroundColor = UIColor.yellow
        //price.text = "$25"
        price.translatesAutoresizingMaskIntoConstraints = false
        
        return price
    }()
    
    func setupViews()   {
        addSubview(cellView)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 5)
        addSubview(productImage)
        productImage.setAnchor(top: cellView.topAnchor, left: cellView.leftAnchor, bottom: nil, right: cellView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 180)
        addSubview(titleLabel)
        titleLabel.setAnchor(top: productImage.bottomAnchor, left: productImage.leftAnchor, bottom: nil, right: productImage.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 45)
        addSubview(priceLabel)
        priceLabel.setAnchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 15)
    }
    
    func updateView(product: Product)   {
        productImage.image = UIImage(named: product.imageName)
        titleLabel.text = product.title
        priceLabel.text = "\(product.price)"
    }
}
