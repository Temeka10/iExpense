//
//  Expenses.swift
//  iExpense
//
//  Created by Artem Mandych on 19.05.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items1 = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items1) {
                UserDefaults.standard.set(encoded, forKey: "Items1")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items1") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items1 = decodedItems
                return
            }
        }
        items1 = []
    }
}
class Expenses1: ObservableObject {
    @Published var items2 = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items2) {
                UserDefaults.standard.set(encoded, forKey: "Items2")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items2") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items2 = decodedItems
                return
            }
        }
        items2 = []
    }
}
