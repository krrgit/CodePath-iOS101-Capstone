//
//  Column.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/10/23.
//

import Foundation


struct Column: Codable {
    var title: String = "Test"
    var logs: [String]
    
    init(title: String, logs: [String]? = nil) {
        self.title = title
        self.logs = logs ?? []
        
        let logCount = Split.getLogCount()
        
        if (self.logs.isEmpty && logCount != 0) {
            let logCount = Split.getLogCount()
            self.logs = Array(repeating: "", count: logCount)
        }
    }
    
    mutating func addLog() {
        
        if title.contains("Log") {
            // Log Column add current log
            let logNum = Split.getLogCount()
            self.logs.insert(String(logNum), at: 0)
            
        } else if title.contains("Date") {
            // Date Column adds current date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM. dd, yyyy"

            let currentDate = Date()
            let formattedDate = dateFormatter.string(from: currentDate)
            
            self.logs.insert(formattedDate, at: 0)
        }else {
            // Exercise Column
            self.logs.insert("", at: 0)
        }
    }
    
}
