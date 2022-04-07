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
    let paymentTypes = ["Cash", "Credit card","Idine points"]
    var body: some View {
        Form{
            Section{
                Picker("How do you want to pay", selection: $paymentType){
                    ForEach(paymentTypes, id:\.self){ type in
                        Text(type)
                    }
                }
            }
        }.navigationTitle("Payment")
         .navigationBarTitleDisplayMode(.inline)
       
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView().environmentObject(Order())
    }
}
