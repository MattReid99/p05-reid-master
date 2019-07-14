//
//  ViewController.swift
//  p05-reid-master
//
//  Created by Matthew Reid on 7/13/19.
//  Copyright © 2019 Matthew Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        Globals.getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Globals.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(Globals.data[indexPath.row])"
        cell.backgroundColor = view.backgroundColor!
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            Globals.data.remove(at: indexPath.row)
            Globals.saveData()
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        guard Int(textField.text!) != nil else {
            return
        }
        let val = Int(textField.text!)!
        Globals.data.append(val)
        self.textField.text = ""
        Globals.saveData()
        self.tableView.reloadData()
    }
    
    
    
    @IBAction func clearPressed(_ sender: Any) {
        let alert = UIAlertController.init(title: "Are you sure you want to delete your data?", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction.init(title: "Yes", style: .default, handler: { Void in
            Globals.data.removeAll()
            Globals.saveData()
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

