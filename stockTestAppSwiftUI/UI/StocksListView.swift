//
//  ContentView.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import SwiftUI
import SwiftData

struct StocksListView: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Query var stocks: [StockModel]
    @Environment(\.modelContext) private var modelContext
    
    private let stockService = StocksService()
    
    var body: some View {
        ScrollView {
            ForEach(stocks) { stock in
                NavigationLink(destination: StockView(stock: stock), label: {
                    VStack {
                        HStack {
                            VStack {
                                Text(stock.symbol)
                                    .font(.title)
                                
                                Text(stock.saSlug)
                            }
                            
                            Spacer()
                            
                            Text(String(stock.last))
                                .bold()
                            
                            Spacer()
                            
                            if let lastDate = stock.lastTime?.toString {
                                Text(lastDate).font(.system(size: 11))
                            } else {
                                fatalError("ERR")
                            }
                        }
                        Divider()
                    }
                })
            }
            .refreshable(action: {
                await load()
            })
            .onReceive(timer) { _ in
                Task {
                    await load()
                }
            }
            Spacer()
        }
        .padding()
    }
    
    private func load() async {
        let arr = await stockService.load()?.realTimeQuotes
        arr?.forEach({
            modelContext.insert($0)
        })
        try! modelContext.save()
    }
}

#Preview {
    StocksListView()
}
