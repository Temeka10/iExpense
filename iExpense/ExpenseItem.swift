//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Artem Mandych on 19.05.2023.
//

import Foundation

enum ExpenseType: Codable {
    case personal, business
}

extension ExpenseType: CaseIterable {
    var title: String {
        switch self {
        case .personal:
            return "personal"
        case .business:
            return "business"
        }
    }
}

struct ExpenseItem: Identifiable, Codable {
    let id: UUID
    let name: String
    let type: ExpenseType
    let amount: Double
}

extension ExpenseItem {
    init(name: String, amount: Double, type: ExpenseType) {
        self.name = name
        self.amount = amount
        self.type = type
        self.id = UUID()
    }
}
