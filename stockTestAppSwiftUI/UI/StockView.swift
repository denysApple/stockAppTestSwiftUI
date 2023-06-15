//
//  StockView.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 15.06.2023.
//

import SwiftUI

struct StockView: View {
    @Bindable var stock: StockModel
    
    var body: some View {
        VStack {
            
            Text("Last time updated: \n\(stock.lastTime?.toString ?? "")")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Text("Current price is \(stock.last)")
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .bold()
                .padding()
            
            Spacer()
            
            Text("Market status \(stock.info)")
                .foregroundColor(stock.isMarketClosed ? .red : .green)
            
            Text("Current market capitalization \(stock.marketCap)")
                .multilineTextAlignment(.center)
                .font(.system(size: 25))
                .padding()
            
            Divider()
            
            Text("Source is \(stock.src)")
            
        }
    }
}
