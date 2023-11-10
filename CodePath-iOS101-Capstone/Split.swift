//
//  Split.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import Foundation

struct Split: Codable {
    var title: String
    
    var exercises: [String]
    
    init(title: String, exercises: [String]? = nil) {
        self.title = title
        self.exercises = exercises ?? ["Start Date"]
    }
    
    // An id (Universal Unique Identifier) used to identify a task.
    var id: String = UUID().uuidString
}

// MARK: - Task + UserDefaults
extension Split {
    

    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ splits: [Split]) {
        // TODO: Save the array of tasks
        
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        let encodedData = try! JSONEncoder().encode(splits)
        // 3.
        defaults.set(encodedData, forKey: "splits")
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getSplits() -> [Split] {
        
        print("try get splits")
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        if let data = defaults.data(forKey: "splits") {
            // 3.
            let decodedSplits = try! JSONDecoder().decode([Split].self, from: data)
            // 4.
            print("get splits", decodedSplits)
            return decodedSplits
        }
        
        print("fail get splits")
        return [] // 👈 replace with returned saved tasks
    }

    // Add a new task or update an existing task with the current task.
    func save() {
        var splits = Split.getSplits()
        
        if let index = splits.firstIndex(where: { $0.id == self.id })  {
            splits.remove(at: index)
            splits.insert(self, at: index)
        } else {
            splits.append(self)
        }
        
        Split.save(splits)
        // TODO: Save the current task
    }
}

