//
//  stockTestAppSwiftUIApp.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import SwiftUI
import SwiftData

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                StocksListView().accentColor(.black)
            }
        }
        .modelContainer(for: StockModel.self)
    }
}
