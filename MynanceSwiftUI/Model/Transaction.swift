//
//  Transaction.swift
//  MynanceSwiftUI
//
//  Created by Sai Bommakanti on 7/3/24.
//

import Foundation

struct Transaction: Identifiable, Codable{
    //transaction details
    let id = UUID() // unique identifier for each Transaction when viewed in the list
    let category: String
    let type: String
    let amount: String
    let date: String
}
