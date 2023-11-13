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
    
}
