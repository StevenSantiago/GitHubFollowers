//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/18/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
