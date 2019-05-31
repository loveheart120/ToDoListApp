//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Natasha Rajpar on 27/12/2018.
//  Copyright © 2018 Natasha Rajpar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item ()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item ()
        newItem2.title = "Buy Eggs"
        itemArray.append(newItem2)
        
        let newItem3 = Item ()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        
    
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK  - TableView DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print ( "cellForRowAtIndexPath Called ")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        // set cell accesory type depending on if the item.done value is true or false
        cell.accessoryType = item.done == true ? .checkmark : .none
        

    
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print (itemArray[indexPath.row])
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        // ! here replaces itemArray[indexPath.row].done with the opposite
        // ! is the "not" operator
        
        // current row selected -> itemArray[indexPath]
        tableView.reloadData()

        // no longer needed as code has been added in line 53 - 56
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        tableView.deselectRow(at: indexPath,animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
   
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
             //what will happen once the user clicks the Add Item Button on our UI Alert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
    
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
            
            print (self.itemArray)
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            print ("Now")
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

