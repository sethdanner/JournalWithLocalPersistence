//
//  EntryDetailViewController.swift
//  JournalWithLocalPersistence
//
//  Created by Seth Danner on 7/30/18.
//  Copyright © 2018 Seth Danner. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: Outlets and Properties
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text,
            let bodyText = bodyTextField.text
            else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyText)
        } else {
            EntryController.shared.addNewEntryWith(title: title, bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    func updateViews() {
        
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
    }
}
