//
//  String+Date.swift
//  stockTestAppSwiftUI
//
//  Created by Denys on 15.06.2023.
//

import Foundation

extension String {
    
    var toDate: Date? {
        let res = Formatter.formatter.date(from: self)
        return res
    }
}
