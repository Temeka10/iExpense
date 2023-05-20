//
//  ContentView.swift
//  iExpense
//
//  Created by Artem Mandych on 18.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false
    @StateObject var expenses1 = Expenses()
    @StateObject var expenses2 = Expenses1()
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(expenses1.items1) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                
                                
                                
                            }
                            
                            Spacer()
                            if item.amount <= 10 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else if item.amount <= 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else if item.amount > 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                    .onDelete(perform: removeItems1)
                } header: {
                    Text("Personal expenses")
                }
                Section {
                    ForEach(expenses2.items2) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                  

                            }
                            
                            Spacer()
                            if item.amount <= 10 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else if item.amount <= 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.green)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else if item.amount > 100 {
                                Text(item.amount, format: .currency(code: "USD"))
                                    .padding()
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                    }
                    .onDelete(perform: removeItems2)
                } header: {
                    Text("Business expenses")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses1: expenses1, expenses2: expenses2)
                }
            }
        }
    }
    func removeItems2(at offsets: IndexSet) {
        expenses2.items2.remove(atOffsets: offsets)
    }

func removeItems1(at offsets: IndexSet) {
    expenses1.items1.remove(atOffsets: offsets)
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
