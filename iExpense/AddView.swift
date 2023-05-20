//
//  AddView.swift
//  iExpense
//
//  Created by Artem Mandych on 19.05.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses1: Expenses
    @ObservedObject var expenses2: Expenses1
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    let types = ["Business", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    if type == "Business" {
                        let item2 = ExpenseItem(name: name, type: type, amount: amount)
                        expenses2.items2.append(item2)
                    }
                    if type == "Personal" {
                            let item1 = ExpenseItem(name: name, type: type, amount: amount)
                            expenses1.items1.append(item1)
                    }
                   
                    dismiss()
                }
            }
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses1: Expenses(),expenses2: Expenses1())
    }
}
