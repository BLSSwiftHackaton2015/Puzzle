//
//  InterfaceController.swift
//  Puzzle WatchKit Extension
//
//  Created by Sebastian Jędruszkiewicz on 13/06/15.
//  Copyright (c) 2015 Hackaton. All rights reserved.
//

import WatchKit
import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
      
        ButtonsMatrix = [btn1x1, btn1x2, btn1x3,
            btn2x1, btn2x2, btn2x3,
            btn3x1, btn3x2, btn3x3]
        reset();
        //todo:changename
        println("awakeWithContext")

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
        println("willActivate")
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        println("didDeactivate")
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
        self.reset()
    }
    
    @IBOutlet weak var counterLabel: WKInterfaceLabel!
    func clickLogger(btn: Int) {
        println(String(btn))
        checkNeighbor(btn)
        rerenderLabels()
    }
    private func swap(index: Int) {
        self.counter++;
        matrix[emptyIndex] = matrix[index]
        matrix[index] = ""
        ImagesMatrix[emptyIndex] = ImagesMatrix[index]
        ImagesMatrix[index] = UIImage()
        emptyIndex = index
        
    }

    private func isEndGame() {
        if (matrix == ["1", "2", "3", "4", "5", "6", "7", "8", ""]) {
            println("you win")
            self.reset()
            presentControllerWithName("GameOverController", context: self)
        }
    }

    private func rerenderLabels() {
    
        self.counterLabel.setText(String(self.counter))
        if let m = ButtonsMatrix {
            for index in 0...8 {
                m[index].setTitle("")
                m[index].setBackgroundImage(ImagesMatrix[index])
            }
        }
    }
    internal func reset() {
        matrix = []
        var array : [String] = ["1","2","3","4","5","6","7","8"]
        array.shuffle()
        for element in array {
            
            matrix.append(element)
        }
        matrix.append("")
        ImagesMatrix.shuffle()
        ImagesMatrix.append(UIImage())
        rerenderLabels()
        
    }
    private var counter : Int = 0;
    private var matrix : [String] = []
    private var ButtonsMatrix : [WKInterfaceButton]?
    private var ImagesMatrix: [UIImage?] = [
        UIImage(named: "logo1x1"),
        UIImage(named: "logo1x2"),
        UIImage(named: "logo1x3"),
        UIImage(named: "logo2x1"),
        UIImage(named: "logo2x2"),
        UIImage(named: "logo2x3"),
        UIImage(named: "logo3x1"),
        UIImage(named: "logo3x2")
    ]

    
    
    private var emptyIndex = 8
    private func checkNeighbor(naturalIndex: Int) {
        var index = naturalIndex-1
        var naturalEmptyIndex = emptyIndex+1
        switch naturalIndex {
        case 1:
            if contains([2,4], naturalEmptyIndex) {
                swap(index)
            }
        case 2:
            if contains([1,3,5], naturalEmptyIndex) {
                swap(index)
            }
        case 3:
            if contains([2,6], naturalEmptyIndex) {
                swap(index)
            }
        case 4:
            if contains([1,5,7], naturalEmptyIndex) {
                swap(index)
            }
        case 5:
            if contains([2,4,6,8], naturalEmptyIndex) {
                swap(index)
            }
        case 6:
            if contains([3,5,9], naturalEmptyIndex) {
                swap(index)
            }
        case 7:
            if contains([4,8], naturalEmptyIndex) {
                swap(index)
            }
        case 8:
            if contains([5,7,9], naturalEmptyIndex) {
                swap(index)
            }
        case 9:
            if contains([6,8], naturalEmptyIndex) {
                swap(index)
            }
        default:
            break
            
        }
        
    }

}
