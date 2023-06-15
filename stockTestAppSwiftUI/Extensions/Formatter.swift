//
//  Formatter.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 15.06.2023.
//

import Foundation


extension Formatter {
    static var formatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }
    
    static var beautyFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        return formatter
    }
}
