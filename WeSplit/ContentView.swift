//
//  ContentView.swift
//  WeSplit
//
//  Created by Nikhil Barik on 18/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPlusTip: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection  = Double(tipPercentage)
        let tipValue = checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue

        return grandTotal
    }
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalPlusTip / peopleCount
        return amountPerPerson
    }
    
    var body: some View{
        
        NavigationView {
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(1..<100){
                            Text("\($0) %")
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalPlusTip, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Grand total + Tips")
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
