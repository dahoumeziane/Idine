//
//  OrderView.swift
//  Idine
//
//  Created by Dahou Meziane on 7/4/2022.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){
                        item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                        
                    }.onDelete(perform: deleteItems)
                }
                Section {
                    NavigationLink(destination: CheckOutView()){
                        Text("Place order")
                    }
                }.disabled(order.items.isEmpty)
                // Disable the button if the orders list is empty
                
            }.navigationTitle("Order")
                .listStyle(InsetGroupedListStyle())
                .toolbar{
                    EditButton()
                }
        }
    }
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}

