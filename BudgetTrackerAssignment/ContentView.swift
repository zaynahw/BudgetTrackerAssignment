//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    // MARK: - Budget Header
                    Text("Budget Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // TODO: Show remaining budget here
                    // Note: Budget can change color in certain cases
                    Text("Remaining: $" + String(format: "%.2f", viewModel.remainingBudget))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(viewModel.budgetColor)
                    
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Add Expense Form
                VStack(spacing: 15) {
                    
                    // TODO: TextField for expense name
                    TextField("Expense Name", text: $expenseName)
                        .padding(10)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        
                    
                    
                    // TODO: TextField for expense amount
                    TextField("Amount", text: $expenseAmount)
                        .padding(10)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .fill(Color.white)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    
                    Button {
                        // TODO: Add expense and remember to clear the fields
                        if let amount = Double(expenseAmount), !expenseName.isEmpty {
                            viewModel.addExpense(name: expenseName, amount: amount)
                            expenseName = ""
                            expenseAmount = ""
                        }
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Expenses List
                VStack(alignment: .leading, spacing: 10) {
                    Text("Expenses")
                        .font(.headline)
                    
                    // TODO: If there are no expenses, show "No expenses yet"
                    if (viewModel.expenses.isEmpty) {
                        Text("No expenses yet")
                            .font(Font.body.italic())
                            .foregroundColor(Color.gray.opacity(0.8))
                    } else {
                        ForEach($viewModel.expenses) { $expense in
                            // TODO: Wrap each expense in a NavigationLink
                            // Destination should be ExpenseDetailView(expense: $expense, viewModel: viewModel)
                            NavigationLink(destination: ExpenseDetailView(expense: $expense, viewModel: viewModel)) {
                                HStack {
                                    Text(expense.name)
                                        .foregroundColor(Color.blue)
                                    Spacer()
                                    Text("$" + String(format: "%.2f",expense.amount))
                                        .foregroundColor(Color.blue)
                                        .bold()
                                    Button(action: {
                                        viewModel.removeExpense(expense: expense)
                                    }) {
                                        Text("Delete")
                                            .foregroundColor(Color.red)
                                            .font(.caption)
                                    }
                                    
                                }
                                
                                
                            }
                            // Inside the row, display:
                            // - Expense name
                            // - Expense amount
                            // - A delete button
                        }
                    }
                                                            
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Budget Tracker")
    }
}

#Preview {
    ContentView()
}
