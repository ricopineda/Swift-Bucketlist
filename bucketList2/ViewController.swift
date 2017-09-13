//
//  ViewController.swift
//  bucketList2
//
//  Created by Enrico Pineda on 9/12/17.
//  Copyright © 2017 Enrico Pineda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AddItemDel {

    var bucket : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bucket.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = bucket[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("nice")
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        bucket.remove(at: indexPath.row)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{
            let addItemViewController = segue.destination as! AddItemViewController
            addItemViewController.delegate = self
        }
        else{
            let addItemViewController = segue.destination as! AddItemViewController
            addItemViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = bucket[indexPath.row]
            addItemViewController.item = item
            addItemViewController.indexPath = indexPath
        }
            
    }
    func cancelButtonPressed(by controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveButtonPressed(by controller: AddItemViewController, text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath{
            bucket[ip.row] = text
        }
        else{
           bucket.append(text)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
//    }
}



