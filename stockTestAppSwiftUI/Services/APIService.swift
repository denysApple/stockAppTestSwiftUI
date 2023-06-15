//
//  APIService.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 14.06.2023.
//

import Foundation

enum APIService {
    
    static let HOME_URL = "https://finance-api.seekingalpha.com/"
    
    case realTimeQuotes(Int)
    
    var rawValue: URL? {
        switch self {
        case .realTimeQuotes(let id):
            return URL(string: "\(APIService.HOME_URL)real_time_quotes?sa_ids=\(id)")
        }
    }
}
