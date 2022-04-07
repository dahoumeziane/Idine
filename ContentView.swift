//
//  ContentView.swift
//  Idine
//
//  Created by Dahou Meziane on 7/4/2022.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView{
            List {
                ForEach(menu){ section in
                    Section(header: Text(section.name) ){
                        ForEach(section.items){ item in
                            NavigationLink(destination:itemDetails(item: item)){
                                itemRow(item: item)
                            }
                            
                            
                        }
                    }
                   
                   
                }
               
                
            }
            .navigationTitle("Menu")
            
        }
       
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
