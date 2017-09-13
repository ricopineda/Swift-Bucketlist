//
//  AddItemViewController.swift
//  bucketList2
//
//  Created by Enrico Pineda on 9/12/17.
//  Copyright © 2017 Enrico Pineda. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var delegate: AddItemDel?
    var item : String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.saveButtonPressed(by: self, text: itemLabel.text!, at: indexPath)
    }
    @IBAction func cencelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
}
