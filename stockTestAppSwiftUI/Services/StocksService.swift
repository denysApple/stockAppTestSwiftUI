//
//  StocksService.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import Foundation

class StocksService {
    
    enum StockServiceError: Error {
        case wrongRequest
    }
    
    func load(stockID: Int = 146) async -> RealTimeQuotes? {
        guard let url = APIService.realTimeQuotes(stockID).rawValue else {
            return nil
        }
        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            let result = try decoder.decode(RealTimeQuotes.self, from: data)
            return result
        } catch {
            print("Failed to load stocks: \(error)")
            return nil
        }
    }
    
}
