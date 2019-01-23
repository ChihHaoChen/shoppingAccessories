//
//  CategoryCell.swift
//  shoppingAccessories
//
//  Created by chihhao on 2019-01-21.
//  Copyright © 2019 ChihHao. All rights reserved.
//

import UIKit

// MARK: Cell View

class CategoryCell: UITableViewCell {
    fileprivate let padding : CGFloat = 16
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "String"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageCellView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews()  {
        addSubview(cellView)
        addSubview(imageCellView)
        addSubview(categoryLabel)
        cellView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        imageCellView.setAnchor(top: cellView.topAnchor, left: cellView.leftAnchor, bottom: cellView.bottomAnchor, right: cellView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        categoryLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        
    }
    
    func updateView(category: Category) {
        self.imageCellView.image = UIImage(named: category.imageName)
        self.categoryLabel.text = category.title
    }
}
