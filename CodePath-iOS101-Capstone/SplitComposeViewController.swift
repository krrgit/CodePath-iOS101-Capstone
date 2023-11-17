//
//  SplitComposeViewController.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

class SplitComposeViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var columnsTableView: UITableView!
    @IBOutlet weak var addExerciseButton: UIView!
    
    var splitToEdit: Split?
    // When a new split is created (or an existing task is edited), this closure is called
    // passing in the split as an argument so it can be used by whoever presented the SplitComposeViewController.
    var onComposeSplit: ((Split) -> Void)? = nil
    
    var columns: [Column] = [Column(title: "Date"), Column(title: "Log #"), Column(title: "Exer 1")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the columns from the split
        // Else initialize them
        columns = splitToEdit?.columns ?? columns
        
        print("🍏Compose", splitToEdit?.title, "logs:", columns[0].logs.count)
        
        // Update Table values
        columnsTableView.isEditing = true
        columnsTableView.dataSource = self
        columnsTableView.tableFooterView = addExerciseButton
        columnsTableView.layer.cornerRadius = 10.0
        
        
        if splitToEdit != nil {
            self.title = "Edit Split"
            self.titleField.text = splitToEdit?.title
        }
    }
    
    
    func UpdateColumnNames() {
        if let visibleIndexPaths = columnsTableView.indexPathsForVisibleRows {
            for indexPath in visibleIndexPaths {
                if let cell = columnsTableView.cellForRow(at: indexPath) as? ColumnNameCell {
                    // Do something with columnNameCell and its index
                    let index = indexPath.row
                    columns[index].title = cell.textField.text ?? ""
                }
            }
        }
    }

    
    @IBAction func didTapCancelButton(_ sender: Any) {
        // Dismiss the TaskComposeViewController.
        dismiss(animated: true)
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        // 1.
        guard let title = titleField.text,
              !title.isEmpty
        else {
            // i.
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            // ii.
            return
        }
        // 2.
        var split: Split
        // 3.
        if let editSplit = splitToEdit {
            // i.
            split = editSplit
            // ii.
            split.title = title
            UpdateColumnNames()
            split.columns = columns
        } else {
            // 4.
            print("title", title)
            UpdateColumnNames()
            split = Split(title: title, columns: self.columns)
        }
        
        // 5.
        onComposeSplit?(split)
        // 6.
        dismiss(animated: true)
        splitToEdit = nil
    }
    
    // Add Column
    @IBAction func didTapAddExerciseButton(_ sender: Any) {
        UpdateColumnNames()
        let logCount = Split.getLogCount()
        print("🍏 Add exercise with " + String(logCount) + " logs")
        columns.append(Column(title:"",logs: Array(repeating: "", count: logCount)))
        columnsTableView.reloadSections(IndexSet(integer: 0), with: .none)
    }
    
    
    // A helper method to present an alert given a title and message.
    // 1. Create an Alert Controller instance with, title, message and alert style.
    // 2. Create an Alert Action (i.e. an alert button)
    //    - You could add an action (i.e. closure) to be called when the user taps the associated button.
    // 3. Add the action to the alert controller
    // 4. Present the alert
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }

}

extension SplitComposeViewController: UITableViewDataSource, UITableViewDelegate {
    // # of elements
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return columns.count
    }
    
    // Configure cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1.
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColumnNameCell", for: indexPath) as! ColumnNameCell
        // 2.
        let columnName = columns[indexPath.row].title
        // 3.
        cell.configure(title: columnName)
        // 4.
        return cell
    }
    
    // Allow cells to move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Swap the rows
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        UpdateColumnNames()
        columns.swapAt(sourceIndexPath.row, destinationIndexPath.row)
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
            columns.remove(at: indexPath.row)
            // 3.
            // 4.
            columnsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
}
