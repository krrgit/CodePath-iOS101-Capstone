//
//  SplitComposeViewController.swift
//  CodePath-iOS101-Capstone
//
//  Created by Kevin Ramos on 11/8/23.
//

import UIKit

class SplitComposeViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    
    
    var splitToEdit: Split?
    // When a new task is created (or an existing task is edited), this closure is called
    // passing in the task as an argument so it can be used by whoever presented the TaskComposeViewController.
    var onComposeSplit: ((Split) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        } else {
            // 4.
            print("title", title)
            split = Split(title: title)
        }
        // 5.
        onComposeSplit?(split)
        // 6.
        dismiss(animated: true)
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
