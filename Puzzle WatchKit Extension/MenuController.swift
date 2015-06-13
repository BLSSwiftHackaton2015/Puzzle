//
//  MenuController.swift
//  Puzzle
//
//  Created by Hackaton on 13/06/15.
//  Copyright (c) 2015 Hackaton. All rights reserved.
//

import WatchKit
import Foundation

enum GameType: Int {
    case Numbers = 0
    case Logo = 1
}


class MenuController: WKInterfaceController {

    @IBOutlet weak var tableOutlet: WKInterfaceTable!
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return GameType(rawValue: rowIndex)?.rawValue
    }
    
    func reloadTable() {
        tableOutlet.setNumberOfRows(2, withRowType: "MenuRow")
        
        for i in 0...1 {
            if let row = tableOutlet.rowControllerAtIndex(i) as? MenuRow, a = GameType(rawValue: i) {
                switch a {
                case .Numbers:
                    row.labelOutlet.setText("Numbers")
                case .Logo:
                    row.labelOutlet.setText("Logo")
                }
            }
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        reloadTable()
        
        var dict = ["operation" : "getImages"] //your dictionary/request to sent to the iPhone
        
        if !WKInterfaceController.openParentApplication(dict, reply: { (reply,error) -> Void in
            println("\(reply)") //your reply data as Dictionary
        }) {
            println("ERROR")
        }
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
