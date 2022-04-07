//
//  CheckOutView.swift
//  Idine
//
//  Created by Dahou Meziane on 7/4/2022.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltydetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var isShowingAlert = false
    let paymentTypes = ["Cash", "Credit card","Idine points"]
    let tipAmounts = [10,15,20,25,0]
    var totalPrice : String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100*Double(tipAmount)
        return formatter.string(from: NSNumber(value: total+tipValue)) ?? "$0"
    }
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay", selection: $paymentType){
                    // Synchronise the value of payment type
                    ForEach(paymentTypes, id:\.self){ type in
                        Text(type)
                    }
                }
                Toggle("Add iDine loyalty card",isOn: $addLoyaltydetails.animation())
                //Two way bindings
                if addLoyaltydetails{
                    TextField("Enter your iDine ID",text: $loyaltyNumber)
                }
                
            }
            Section(header: Text("Add a tip ?")){
                Picker("Pourcentage:", selection: $tipAmount){
                    ForEach(tipAmounts, id:\.self){ amount in
                        Text("\(amount)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section(header: Text("Total: \(totalPrice)").font(.title2)){
                Button("Confirm order"){
                    //Place the order
                    isShowingAlert.toggle() 
                }
            }
        }.navigationTitle("Payment")
         .navigationBarTitleDisplayMode(.inline)
         .alert( isPresented: $isShowingAlert){
             //Display the alert
             Alert(title: Text("Order confirmed"),message: Text("Your total was \(totalPrice)"),dismissButton: .default(Text("Okay")))
         }
       
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView().environmentObject(Order())
    }
}
