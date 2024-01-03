//
//  ContentView.swift
//  WeSplit
//
//  Created by Reza Esfandiari on 1/2/24.
//

import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 20
  
  @FocusState private var amountIsFocused: Bool
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentage)
    
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    let amoutPerPerson = grandTotal / peopleCount
    
    return amoutPerPerson
  }
  
  var totalAmountWithTip: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let totalAmount = totalPerPerson * peopleCount
    
    return totalAmount
  }
  
  var currency: FloatingPointFormatStyle<Double>.Currency {
    return FloatingPointFormatStyle.Currency(code: Locale.current.currency?.identifier ?? "USD")
  }

    var body: some View {
      NavigationStack {
        Form {
          Section {
            TextField("Amount", value: $checkAmount, format: currency)
              .keyboardType(.decimalPad)
              .focused($amountIsFocused)
            
            Picker("Number of people", selection: $numberOfPeople) {
              ForEach(2..<100) {
                Text("\($0) people")
              }
            }
          }
          Section {
            Picker("Tip percentage", selection: $tipPercentage) {
              ForEach(tipPercentages, id: \.self) {
                Text($0, format: .percent)
              }
            }
            .pickerStyle(.segmented)
          } header : {
            Text("How much tip do you want to leave")
          }
          
          Section {
            Text(totalPerPerson, format: currency)
          } header : {
            Text("Amount per person")
          }
          
          Section {
            Text(totalAmountWithTip, format: currency)
          } header : {
            Text("Total amount")
          }
        }
        .navigationTitle("WeSplit")
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            Button("Done") {
              amountIsFocused = false
            }
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
