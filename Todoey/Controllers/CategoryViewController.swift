//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Jorge Saraiva on 11/24/18.
//  Copyright © 2018 Jorge Saraiva. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()

       // loadItems()
    }

    //MARK: - Add new Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        let alert = UIAlertController(title: "Add new Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            //what will happen once user clicks the add item button on our UIAlert
            
            let newCategory = Category()
            
            newCategory.name = textField.text!
            
            self.categoryArray.append(newCategory)
            self.save(category: newCategory)
            
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
        
        //Ternary Operator
        //value = condition ? valueIfTrue : valueIfFalse
        //cell.accessoryType = category.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(category: Category){
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \n \(error)")
        }
        
        tableView.reloadData()
    }
    

//    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
//        do {
//            categoryArray = try context.fetch(request)
//        }catch {
//            print("Error fecthing data from text issue: \(error)")
//        }
//        tableView.reloadData()
//    }
   
    
    
    
}
