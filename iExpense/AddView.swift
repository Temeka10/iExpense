//
//  AddView.swift
//  iExpense
//
//  Created by Artem Mandych on 19.05.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var expenses: Expenses
    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0.0
    
    private let types = ExpenseType.allCases
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0.title.capitalized)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, amount: amount, type: type)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: .constant(Expenses()))
    }
}
