//
//  LogViewController.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/7/23.
//

import UIKit

class LogViewController: UIViewController {

    @IBOutlet weak var newSplitView: UIView!
    @IBOutlet weak var tableView: UITableView!
    // The main tasks array initialized with a default value of an empty array.
    var splits = [Split]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        

        // Set table view delegate
        // Needed to detect row selection: tableView(_:didSelectRowAt:)
//        tableView.delegate = self
    }
    
    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshSplits()
    }
    
    @IBAction func didTapNewSplitButton(_ sender: Any) {
        print("New Split")
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
                    
                }
            }
        }
        
    }
    
    private func refreshSplits() {
        print("refresh", splits)
        // 1.
        var splits = Split.getSplits()
//        print("new splits from refresh",splits)
//        // 2.
//        tasks.sort { lhs, rhs in
//            if lhs.isComplete && rhs.isComplete {
//                // i.
//                return lhs.completedDate! < rhs.completedDate!
//            } else if !lhs.isComplete && !rhs.isComplete {
//                // ii.
//                return lhs.createdDate < rhs.createdDate
//            } else {
//                // iii.
//                return !lhs.isComplete && rhs.isComplete
//            }
//        }
//        // 3.
        self.splits = splits
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
        // 1.
        let cell = tableView.dequeueReusableCell(withIdentifier: "SplitCell", for: indexPath) as! SplitCell
        // 2.
        let split = splits[indexPath.row]
        // 3.
        cell.configure(with: split)
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
            // 3.
            Split.save(splits)
            // 4.
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
