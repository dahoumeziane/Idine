//
//  IdineApp.swift
//  Idine
//
//  Created by Dahou Meziane on 7/4/2022.
//

import SwiftUI

@main
struct IdineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(order)
        }
    }
}
