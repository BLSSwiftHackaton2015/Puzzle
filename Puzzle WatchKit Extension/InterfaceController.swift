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
        ButtonsMatrix = [btn1x1, btn1x2, btn1x3,
        btn2x1, btn2x2, btn2x3,
        btn3x1, btn3x2, btn3x3]
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
        checkNeighbor(btn)
        rerenderLabels()
    }
    private func swap(index: Int) {
        matrix[emptyIndex] = matrix[index]
        matrix[index] = ""
        emptyIndex = index
    }
    private func rerenderLabels() {
        if let m = ButtonsMatrix {
            for index in 1...9 {
                m[index-1].setTitle(matrix[index])
            }
        }
    }
    
    private var matrix : [String] = ["0","1","2","3","4","5","6","7","8",""]
    private var ButtonsMatrix : [WKInterfaceButton]?
    private var emptyIndex = 9
    private func checkNeighbor(index: Int) {
        switch index {
        case 1:
            if contains([2,4], emptyIndex) {
                swap(index)
            }
        case 2:
            if contains([1,3,5], emptyIndex) {
                swap(index)
            }
        case 3:
            if contains([2,6], emptyIndex) {
                swap(index)
            }
        case 4:
            if contains([1,5,7], emptyIndex) {
                swap(index)
            }
        case 5:
            if contains([2,4,6,8], emptyIndex) {
                swap(index)
            }
        case 6:
            if contains([3,5,9], emptyIndex) {
                swap(index)
            }
        case 7:
            if contains([4,8], emptyIndex) {
                swap(index)
            }
        case 8:
            if contains([5,7,9], emptyIndex) {
                swap(index)
            }
        case 9:
            if contains([6,8], emptyIndex) {
                swap(index)
            }
        default:
            break
            
        }
        
    }

}
