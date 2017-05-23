//
//  ViewController.swift
//  EnableButtonIfAtLeastOneCheckboxIsSelected
//
//  Created by François Levaux on 23.05.17.
//  Copyright © 2017 François Levaux. All rights reserved.
//
// Create 3 checkboxes & link them to this file
// Create one button, bind "Enabled" to "Enable Button If At Least One Checkbox Is Selected"
// with Model Key Path set to "self.atLeastOneSelectedButton"
//
// tl;dr use "directory1Button.cell.state"
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var checkbox1: NSButton!
    @IBOutlet weak var checkbox2: NSButton!
    @IBOutlet weak var checkbox3: NSButton!
    
    // Register Dependent Keys
    // https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueObserving/Articles/KVODependentKeys.html
    dynamic class func keyPathsForValuesAffectingAtLeastOneSelectedCheckbox() -> Set<String> {
        return ["checkbox1.cell.state",
                "checkbox2.cell.state",
                "checkbox3.cell.state"]
    }
    
    dynamic var atLeastOneSelectedCheckbox: Bool {
        return [checkbox1, checkbox2, checkbox3].contains(where: { $0.state == NSOnState })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
