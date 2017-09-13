//
//  AddItemDel.swift
//  bucketList2
//
//  Created by Enrico Pineda on 9/12/17.
//  Copyright © 2017 Enrico Pineda. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDel: class {
    func cancelButtonPressed(by controller: AddItemViewController)
    
    func saveButtonPressed(by controller: AddItemViewController, text: String, at: NSIndexPath?)
}
