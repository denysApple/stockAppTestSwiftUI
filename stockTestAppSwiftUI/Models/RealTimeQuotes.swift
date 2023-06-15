//
//  RealTimeQuotes.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import Foundation
import SwiftData

struct RealTimeQuotes: Codable {
    let realTimeQuotes: [StockModel]

    enum CodingKeys: String, CodingKey {
        case realTimeQuotes = "real_time_quotes"
    }
}
