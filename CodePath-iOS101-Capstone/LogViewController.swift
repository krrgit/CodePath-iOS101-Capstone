//
//  LogViewController.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/7/23.
//

import UIKit
// Called when the a log entry is edited
// Used to update the Database
protocol LogEntryUpdateDelegate: AnyObject {
    func LogEntryUpdate(s: Int, c: Int, l: Int, text: String)
}

class LogViewController: UIViewController, LogEntryUpdateDelegate {
    
    static let LogView = LogViewController.self
    
    // This delegate is called when text editing of an entry is finished(LogCell.didLogTextEditEnd)
    // This then calls the LogEntryUpdate function
    // The log's value is updated, and the split is saved
    static weak var logEntryUpdateDelegate: LogEntryUpdateDelegate?

    @IBOutlet weak var addLogButton: UIBarButtonItem!
    @IBOutlet weak var newSplitView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // The main tasks array initialized with a default value of an empty array.
    var splits = [Split]()
    var logCount: Int = 0
    
    // Updates a log entry
    func LogEntryUpdate(s: Int, c: Int, l: Int, text: String) {
        splits[s].columns[c].logs[l] = text
        print("🍏Update: s:", s, "c:", c, "l:", l, "text:", text, "stored:", splits[s].columns[c].logs[l])
        splits[s].save()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logCount = Split.getLogCount()

        // Hide top cell separator
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = newSplitView

        // Set table view data source
        // Needed for standard table view setup:
        //    - tableView(numberOfRowsInSection:)
        //    - tableView(cellForRowAt:)
        // Also for swipe to delete row:
        //    - tableView(_:commit:forRowAt:)
        tableView.dataSource = self
        tableView.delegate = self
        
        // allows LogCell to call LogEntryUpdate via the delegate
        LogViewController.logEntryUpdateDelegate = self
    }
    
    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshSplits()
    }
    
    
    @IBAction func didTapNewLogButton(_ sender: Any) {
        AddLogToSplits()
    }
    
    func AddLogToSplits() {
        logCount += 1
        Split.setLogCount(logCount: logCount)
        
        // Add it to the database
        for s in 0..<splits.count {
            for c in 0..<splits[s].columns.count {
                splits[s].columns[c].logs.insert("", at: 0)
            }
        }
        Split.save(splits)
        UpdateSubViews()
    }
    
    private func UpdateSubViews() {
        print("🍏Update SubViews")
        // Iterate through Splits and configure with new data
        for (s, cell) in tableView.visibleCells.enumerated() {
            if let splitCell = cell as? SplitCell {
                splitCell.configure(with: splits[s], s: s)
                // Iterate through columns and configure with new data
                for (c,subCell) in splitCell.collectionView.visibleCells.enumerated() {
                    if let columnCell = subCell as? ColumnCell {
                        columnCell.configure(with: splits[s].columns[c], s: s, c: c)
                    }
                }
            }
        }
    }
    
    @IBAction func didTapNewSplitButton(_ sender: Any) {
        print("🍏New Split")
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 1.
        if segue.identifier == "ComposeSegue" {
            print("got segue")
            // 2.
            // i.
            if let composeNavController = segue.destination as? UINavigationController,
                // ii.
               let composeViewController = composeNavController.topViewController as? SplitComposeViewController {
                print("got compose view controller")

                // 3.
                composeViewController.splitToEdit = sender as? Split
                // 4.
                // i.
                // ii.
                composeViewController.onComposeSplit = { [weak self] split in
                    print("split composed", split)
                    split.save()
                    self?.refreshSplits()
                    self?.UpdateSubViews()
                }
            }
        }
        
    }
    
    private func refreshSplits() {
        print("refresh")
        // 1.
        self.splits = Split.getSplits()
//        // 4.
//        emptyStateLabel.isHidden = !tasks.isEmpty
//        // 5.
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
}

// MARK: - Table View Data Source Methods

// An extension to group all table view data source related methods
extension LogViewController: UITableViewDataSource {

    // The number of rows to show
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return splits.count
    }

    // Create and configure a cell for each row of the table view (i.e. each task in the tasks array)
    // 1. Dequeue a Task cell.
    // 2. Get the task for the associated row.
    // 3. Configure the cell with the task and add the code to be run when the complete button is tapped...
    //    i. Save the task passed back in the closure.
    //    ii. Refresh the tasks list to reflect the updates with the saved task.
    // 4. Return the configured cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Spawn Split")
        // 1.
        let cell = tableView.dequeueReusableCell(withIdentifier: "SplitCell", for: indexPath) as! SplitCell
        // 2.
        let split = splits[indexPath.row]
        // 3.
        cell.configure(with: split, s: indexPath.row)
        // 4.
        return cell
    }

    // Enable "Swipe to Delete" functionality. The existence of this data source method enables the default "Swipe to Delete".
    // 1. Handle the "delete" case:
    // 2. Remove the associated task from the tasks array.
    // 3. Save the updated tasks array.
    // 4. Tell the table view to delete the associated row.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 1.
        if editingStyle == .delete {
            // 2.
            splits.remove(at: indexPath.row)
            
            // Reset the Logs if there are no splits
            if splits.isEmpty {
                print("🍏Clear logs")
                print("🍏Clear splits", splits.count)
                logCount = 0
                Split.setLogCount(logCount: logCount)
            }
            
            // 3.
            Split.save(splits)
            
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension LogViewController: UITableViewDelegate {
    // Select Split to Edit
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Split")
        // 1.
        tableView.deselectRow(at: indexPath, animated: false)
        // 2.
        let selectedSplit = splits[indexPath.row]
        // 3.
        performSegue(withIdentifier: "ComposeSegue", sender: selectedSplit)
    }
    
}
