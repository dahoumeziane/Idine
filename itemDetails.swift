//
//  itemDetails.swift
//  Idine
//
//  Created by Dahou Meziane on 7/4/2022.
//

import SwiftUI

struct itemDetails: View {
    @EnvironmentObject var order : Order
    let item: MenuItem
    var body: some View {
        VStack{
            
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                    
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(Color.black.opacity(0.8))
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
                    
            }
            
            Text(item.description)
                .padding()
            Button("Order this"){
                order.add(item: item)
                    
            }.font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct itemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            itemDetails(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
