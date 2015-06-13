//
//  InterfaceController.swift
//  Puzzle WatchKit Extension
//
//  Created by Sebastian Jędruszkiewicz on 13/06/15.
//  Copyright (c) 2015 Hackaton. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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




    @IBOutlet weak var btn1x1: WKInterfaceButton!
    @IBOutlet weak var btn1x2: WKInterfaceButton!
    @IBOutlet weak var btn1x3: WKInterfaceButton!

    @IBOutlet weak var btn2x1: WKInterfaceButton!
    @IBOutlet weak var btn2x2: WKInterfaceButton!
    @IBOutlet weak var btn2x3: WKInterfaceButton!

    @IBOutlet weak var btn3x1: WKInterfaceButton!
    @IBOutlet weak var btn3x2: WKInterfaceButton!
    @IBOutlet weak var btn3x3: WKInterfaceButton!

    
    @IBAction func btn1x1Click() {
        clickLogger(1)
    }
    
    @IBAction func btn1x2Click() {
        clickLogger(2)
    }
    
    @IBAction func btn1x3Click() {
        clickLogger(3)
    }
    
    @IBAction func btn2x1Click() {
        clickLogger(4)
    }
    
    @IBAction func btn2x2Click() {
        clickLogger(5)
    }
    
    @IBAction func btn2x3Click() {
        clickLogger(6)
    }
    
    @IBAction func btn3x1Click() {
        clickLogger(7)
    }
    
    @IBAction func btn3x2Click() {
        clickLogger(8)
    }
    
    @IBAction func btn3x3Click() {
        clickLogger(9)
    }
    
    func clickLogger(btn: Int) {
        println(String(btn))
    }
    
}
