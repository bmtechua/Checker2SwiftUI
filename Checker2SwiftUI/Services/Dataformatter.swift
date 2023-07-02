//
//  Dataformatter.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 24.04.2023.
//

import Foundation
import UIKit

let date = dateSet()
//set date
func dateSet() -> String {
    let now = Date()
    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now)! // вчорашня дата та час
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let dateFormatterString = formatter.string(from: yesterday)
    return dateFormatterString
}


//convert string to date
func stringToDate(date: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let temp = formatter.date(from: date)
    return temp ?? Date()
}

//calculate time ago from published
extension Date {
func timeAgo() -> String {

    let secondsAgo = Int(Date().timeIntervalSince(self))

    let minute = 60
    let hour = 60 * minute
    let day = 24 * hour
    let week = 7 * day
    let month = 4 * week

    let quotient: Int
    let unit: String
    if secondsAgo < minute {
        quotient = secondsAgo
        unit = "second"
    } else if secondsAgo < hour {
        quotient = secondsAgo / minute
        unit = "min"
    } else if secondsAgo < day {
        quotient = secondsAgo / hour
        unit = "hour"
    } else if secondsAgo < week {
        quotient = secondsAgo / day
        unit = "day"
    } else if secondsAgo < month {
        quotient = secondsAgo / week
        unit = "week"
    } else {
        quotient = secondsAgo / month
        unit = "month"
    }
    return "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
}
}
