//
//  AddTransactionViewController.swift
//  MynanceSwiftUI
//
//  Created by Sai Bommakanti on 7/3/24.
//

import Foundation

class AddTransactionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionCategories.count;
    }
    
  
  let transactionCategories: [String] = ["Income", "Groceries", "Utilities"]

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var transactionCategoryPickerView: UIPickerView!
    var rowSelected: String = "";
    var amountValue: Double = 0.00;
    var previousBalance: String = "$0.00"
    
    @IBAction func saveButtonPressed(_ sender: Any){}
    @IBAction func cancelButtonPressed(_ sender: Any){
        
    }
    
    @IBAction func amountTextFieldAction(_ sender: Any) {
        //leaves the $ out of the amount of money
        if(amountTextField.hasText && descriptionTextField.hasText)
        {
            saveButton.isEnabled = true;
        }
        var amountText = "";
        for char in amountTextField.text! where char != "$"
        {
            let charAsString: String = String(char);
            amountText+=charAsString;
        }
        amountValue = Double(amountText) ?? 0.00;
        
    }
   
    @IBAction func descriptionTextFieldAction(_ sender: Any) {
        //condition to activate dave button
        if(amountTextField.hasText && descriptionTextField.hasText)
        {
            saveButton.isEnabled = true;
        }
        
    }
    override func viewDidLoad() {
        //loads the picker view and disables the save button
        super.viewDidLoad()
        transactionCategoryPickerView.delegate = self
        transactionCategoryPickerView.dataSource = self
        saveButton.isEnabled = false;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return transactionCategories[row]
      }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rowSelected = transactionCategories[row]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let destVC = segue.destination as! MynanceTableViewController
            if (rowSelected == "Utilities")
            {
                //add amount to balance, then pass it to ViewController
                var balanceAsDouble: Double = 0.00;
                var modifiedBalance: String = ""
                let startIndex: String.Index = destVC.amountLabel.text!.startIndex
                let indexAfter: String.Index = (destVC.amountLabel.text?.index(after: startIndex))!
                let endIndex = destVC.amountLabel.text!.endIndex
                modifiedBalance =  String((destVC.amountLabel.text?[indexAfter..<endIndex])!)
                balanceAsDouble = Double(modifiedBalance)!
                let newBalanceAsString = String(balanceAsDouble + amountValue)
                destVC.newBalance = newBalanceAsString;
                destVC.amountLabel.text = "$" + newBalanceAsString
                previousBalance = newBalanceAsString
                let date = Date()
                let formatter =  DateFormatter()
                formatter.timeZone = .current
                formatter.locale = .current
                formatter.dateFormat = "m/dd/yyyy"
                destVC.addTransaction(category: rowSelected, description: descriptionTextField.text!, amount: amountTextField.text!, date: formatter.string(from: date))
            }
            else if(rowSelected != "Income" && cancelButton.isSelected)
            {
                //substract amount from balance, then pass it
                var balanceAsDouble: Double = 0.00;
                var modifiedBalance: String = ""
                let startIndex: String.Index = destVC.amountLabel.text!.startIndex
                let indexAfter: String.Index = (destVC.amountLabel.text?.index(after: startIndex))!
                let endIndex = destVC.amountLabel.text!.endIndex
                modifiedBalance =  String((destVC.amountLabel.text?[indexAfter..<endIndex])!)
                balanceAsDouble = Double(modifiedBalance)!
                let newBalanceAsString = String(balanceAsDouble - amountValue)
                destVC.newBalance = newBalanceAsString;
                destVC.amountLabel.text = "$" + newBalanceAsString
                previousBalance = newBalanceAsString
                let date = Date()
                let formatter =  DateFormatter()
                formatter.timeZone = .current
                formatter.locale = .current
                formatter.dateFormat = "mm/dd/yyyy"
                destVC.addTransaction(category: rowSelected, description: descriptionTextField.text!, amount: amountTextField.text!, date: formatter.string(from: date))
            }
            else
            {
                destVC.newBalance = previousBalance
            }
            
        
       
    }
   

}

//#Preview {
//    AddTransactionViewController()
//}
