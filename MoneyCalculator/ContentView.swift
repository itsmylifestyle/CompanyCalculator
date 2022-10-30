//
//  ContentView.swift
//  MoneyCalculator
//
//  Created by Айбек on 30.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var people = 2
    @State private var tipPercentage = 0

    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson : Double {
        let peopleCount = Double(people + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let AmountperPerson = grandTotal / peopleCount
        
        return AmountperPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("NumberOfPeople", selection: $people) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])% ")
                        } .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
                
            } .navigationBarTitle("Tip Calculator", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
