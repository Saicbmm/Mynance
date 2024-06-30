//
//  CustomTableViewCell.swift
//  MynanceiOS
//
//  Created by Sai Bommakanti on 6/23/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"

    var categoryName = UILabel()
    var typeDescription = UILabel()
    var amount = UILabel()
    var date = UILabel()
    
    func configure(with categoryName: String, typeDescription: String, amount: String, date: String)
    {
        //initializes cell attributes
        self.categoryName.text = categoryName
        self.typeDescription.text = typeDescription
        self.amount.text = amount
        self.date.text = date
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //structure of custom cell
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(categoryName)
        self.addSubview(typeDescription)
        self.addSubview(amount)
        self.addSubview(date)
        categoryName.frame = CGRect(x: 10, y: 0, width: 10, height: 10)
        typeDescription.frame = CGRect(x: 10, y: 20, width: 10, height: 10)
        amount.frame = CGRect(x: 80, y: 0, width: 10, height: 10)
        date.frame = CGRect(x: 80, y: 20, width: 10, height: 10)
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
   
   
}
