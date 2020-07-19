//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by Steven Santiago on 7/18/20.
//  Copyright © 2020 Steven Santiago. All rights reserved.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "rn_US_POSIX")
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return ""}
        return "Github since " + date.convertToMonthYearFormat()
    }
}
