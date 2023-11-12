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
        self.logs = logs ?? ["1", "0"]
    }
    
}
