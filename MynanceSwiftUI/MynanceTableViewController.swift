//
//  MynanceTableViewController.swift
//  MynanceSwiftUI
//
//  Created by Sai Bommakanti on 7/3/24.
//

import Foundation

class MynanceTableViewController: UIViewController {
   

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    var newBalance: String = "$0.00"
    var coder: NSCoder
    
   // var transactionObj: Transaction = Transaction(category: "", type: "", amount: "", date: "")
    
    var transactionList: [Transaction] = [Transaction(category: "Utilities", type: "Gas", amount: "$90", date: "01/01/20"),
                                          Transaction(category: "Income", type: "W2", amount: "$50", date: "01/01/24")]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        self.coder = NSCoder()
       // transactionList.append(addNewTransction)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        commonInit()
    }
    

    
    required init? (coder: NSCoder){
        self.coder = coder
        super.init(coder: coder)
  
        commonInit()
    }
    
    private func commonInit() {
        //self.coder = coder
    
    }
    
    func addTransaction(category: String, description: String, amount: String, date: String)
    {
        //storing the transaction details into an object
        let newTransaction = Transaction.init(category: category, type: description, amount: amount, date: date)
      
        transactionList.append(newTransaction)
//        //creating a cell to be added on the tableview
//        let cell = table.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
//        cell?.configure(with: newTransaction.category, typeDescription: newTransaction.type, amount: newTransaction.amount, date: newTransaction.date)
        
        table.reloadData()
    }
   
   
    
    override func viewDidLoad() {
//        //loads table and initializes amountLabel
        super.viewDidLoad()
////        self.table?.dataSource = self
////        self.table?.delegate = self
        amountLabel.text? = newBalance
        table.register(UITableViewCell.self, forCellReuseIdentifier: "FeatureCell")
//        table.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of rows in table view
        return transactionList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creates the cell
        // will come back to add this CustomTableCell = TTDT
//     let cell = table.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
//        cell?.configure(with: transactionObj.category, typeDescription: transactionObj.type, amount: transactionObj.amount, date: transactionObj.date)
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell") ?? UITableViewCell(style: .default, reuseIdentifier: "FeatureCell")
        cell.textLabel?.text = transactionList[indexPath.row].category
        return cell
    }
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) {
        //segue to pass transaction info from AddTransaction vc to ViewController
    }
    
    // indexPath.row number to go into the detail View... after user clicks on item.
    

}

