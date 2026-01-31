//
//  ExpenseDetailView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

struct ExpenseDetailView: View {
    @Binding var expense: Expense
    @State var viewModel: BudgetViewModel
    
    var body: some View {
        List {
            Section(header: Text("Expense Info")) {
                // TODO: Create a row for editing the expense name
                HStack {
                    Text("Name")
                        .fontWeight(.heavy)
                    Spacer()
                    TextField("Name", text: $expense.name)
                        .multilineTextAlignment(.trailing)
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 20)

                
                
                // TODO: Create a row for editing the expense amount
                HStack {
                    Text("Amount")
                        .fontWeight(.heavy)
                    Spacer()
                    TextField("Amount",value: $expense.amount, format: .currency(code: "USD"))
                        .multilineTextAlignment(.trailing)
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 20)
            }
            
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Expense")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}


#Preview {
    ExpenseDetailView(expense: .constant(Expense(name: "Pizza", amount: 56.34)), viewModel: BudgetViewModel())
}
