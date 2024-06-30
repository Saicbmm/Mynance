//
//  MynanceTableViewController.swift
//  MynanceiOS
//
//  Created by Sai Bommakanti on 2/25/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    var newBalance: String = "$0.00"
    struct Transaction {
        //transaction details
        let category: String
        let type: String
        let amount: String
        let date: String
    }
    var transactionObj: Transaction = Transaction(category: "", type: "", amount: "", date: "")
    func addTransaction(category: String, description: String, amount: String, date: String)
    {
        //storing the transaction details into an object
        transactionObj = Transaction.init(category: category, type: description, amount: amount, date: date)
        //creating a cell to be added on the tableview
        let cell = table.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        cell?.configure(with: transactionObj.category, typeDescription: transactionObj.type, amount: transactionObj.amount, date: transactionObj.date)
    }
   
   
    
    override func viewDidLoad() {
        //loads table and initializes amountLabel
        super.viewDidLoad()
        self.table?.dataSource = self
        self.table?.delegate = self
        amountLabel.text? = newBalance
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows in table view
       return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creates the cell
     let cell = table.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        cell?.configure(with: transactionObj.category, typeDescription: transactionObj.type, amount: transactionObj.amount, date: transactionObj.date)
        return cell!
    }
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        //segue to pass transaction info from AddTransaction vc to ViewController 
    }
    

}

