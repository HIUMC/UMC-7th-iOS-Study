//
//  main.swift
//  5A
//
//  Created by 김호성 on 2024.11.03.
//

import Foundation

class BankAccount {
    let accountNumber: String
    private(set) var balance: Double
    
    init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        self.balance += amount
        print("Deposited \(amount). Current balance: \(self.balance)")
    }
    func withdraw(amount: Double) {
        if amount > self.balance {
            print("Insufficient funds.")
            return
        }
        self.balance -= amount
        print("Withdrew \(amount). Current balance: \(self.balance)")
    }
}

let account = BankAccount(accountNumber: "123-456", initialBalance: 100.0)

account.deposit(amount: 50.0) // 출력: "Deposited 50.0. Current balance: 150.0"
account.withdraw(amount: 30.0) // 출력: "Withdrew 30.0. Current balance: 120.0"
account.withdraw(amount: 200.0) // 출력: "Insufficient funds. Current balance: 120.0"
