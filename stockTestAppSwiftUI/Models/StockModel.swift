//
//  StockModel.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import Foundation

//  "sa_id": 146,
//  "sa_slug": "aapl",
//  "symbol": "AAPL",
//  "high": 184.15,
//  "low": 182.44,
//  "open": 182.76,
//  "close": 183.31,
//  "prev_close": 183.79,
//  "last": 183.31,
//  "volume": 45603057,
//  "last_time": "2023-06-13T15:59:59.987-04:00",
//  "market_cap": 2883228363620,
//  "ext_time": "2023-06-14T08:07:36.496-04:00",
//  "ext_price": 183.4,
//  "ext_market": "pre",
//  "info": "Market Close",
//  "src": "IexPuller",
//  "updated_at": "2023-06-14T08:10:08.609-04:00"

import SwiftData

@Model
class StockModel: Identifiable, Encodable, Equatable, Decodable {
    
    var id: Int {
        return saId
    }
    
    @Attribute(.unique) let saId: Int
    let saSlug: String
    let symbol: String
    let info: String
    let src: String
    let high, low, open, close, prevClose, last: Double
    let volume: Int
    let lastTime, extTime, updatedAt: Date?
    let marketCap: Int64
    let extPrice: Double
    let extMarket: String
    
    var isMarketClosed: Bool {
        info.lowercased().contains("close")
    }

    enum CodingKeys: String, CodingKey {
        case saId = "sa_id"
        case saSlug = "sa_slug"
        case symbol, info, src, high, low, open, close, volume
        case prevClose = "prev_close"
        case last = "last"
        case lastTime = "last_time"
        case marketCap = "market_cap"
        case extTime = "ext_time"
        case updatedAt = "updated_at"
        case extPrice = "ext_price"
        case extMarket = "ext_market"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        saId = try values.decode(Int.self, forKey: .saId)
        saSlug = try values.decode(String.self, forKey: .saSlug)
        symbol = try values.decode(String.self, forKey: .symbol)
        info = try values.decode(String.self, forKey: .info)
        src = try values.decode(String.self, forKey: .src)
        high = try values.decode(Double.self, forKey: .high)
        low = try values.decode(Double.self, forKey: .low)
        open = try values.decode(Double.self, forKey: .open)
        close = try values.decode(Double.self, forKey: .close)
        prevClose = try values.decode(Double.self, forKey: .prevClose)
        last = try values.decode(Double.self, forKey: .last)
        volume = try values.decode(Int.self, forKey: .volume)
        marketCap = try values.decode(Int64.self, forKey: .marketCap)
        extPrice = try values.decode(Double.self, forKey: .extPrice)
        extMarket = try values.decode(String.self, forKey: .extMarket)

        // CUSTOM
        lastTime = try? values.decode(String.self, forKey: .lastTime).toDate
        extTime = try? values.decode(String.self, forKey: .extTime).toDate
        updatedAt = try? values.decode(String.self, forKey: .updatedAt).toDate
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(saId, forKey: .saId)
        try container.encode(saSlug, forKey: .saSlug)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(info, forKey: .info)
        try container.encode(src, forKey: .src)
        try container.encode(high, forKey: .high)
        try container.encode(low, forKey: .low)
        try container.encode(open, forKey: .open)
        try container.encode(close, forKey: .close)
        try container.encode(prevClose, forKey: .prevClose)
        try container.encode(last, forKey: .last)
        try container.encode(volume, forKey: .volume)
        try container.encode(marketCap, forKey: .marketCap)
        try container.encode(extPrice, forKey: .extPrice)
        try container.encode(extMarket, forKey: .extMarket)
        try container.encode(lastTime?.toString, forKey: .lastTime)
        try container.encode(extTime?.toString, forKey: .extTime)
        try container.encode(updatedAt?.toString, forKey: .updatedAt)
    }
}
