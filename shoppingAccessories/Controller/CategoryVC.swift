//
//  CategoryVC.swift
//  shoppingAccessories
//
//  Created by chihhao on 2019-01-19.
//  Copyright © 2019 ChihHao. All rights reserved.
//

import UIKit


// MARK: Header View in Category Page
class Header: UITableViewHeaderFooterView   {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOP BY CATEGORY"
        label.backgroundColor = UIColor.white
        label.font = UIFont(name: "avenir", size: 18)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setupView() {
        
        addSubview(headerLabel)
        self.contentView.backgroundColor = UIColor.white
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":headerLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":headerLabel]))
    }
}

// MARK: Category Table View
class CategoryVC: UITableViewController {
    
    fileprivate let categoryId = "categoryId"
    fileprivate let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CODERSWAG"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupTableView()
    }
    
    fileprivate func setupTableView()   {
        tableView?.alwaysBounceVertical = true
        tableView?.separatorStyle = .none
        
        tableView?.register(Header.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView?.register(CategoryCell.self, forCellReuseIdentifier: categoryId)
        
        tableView?.sectionHeaderHeight = 50
        tableView?.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataService.instance.getCategories().count
    }

    override var preferredStatusBarStyle: UIStatusBarStyle  {
        return UIStatusBarStyle.lightContent
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: categoryId, for: indexPath) as? CategoryCell    {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateView(category: category)
            return cell
        }
        else{
            return CategoryCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
 
    // MARK: Pass data without segues which itself is a component of storyboard
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // very IMPORTANT here to have collectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let controller = ProductVC(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)
        let category = DataService.instance.getCategories()[indexPath.row]
        controller.productTitle = category.title
        
    }
    


}
