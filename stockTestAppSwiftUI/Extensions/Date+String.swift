//
//  Date+String.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 15.06.2023.
//

import Foundation


extension Date {
    var toString: String {
        Formatter.beautyFormatter.string(from: self)
    }
}
