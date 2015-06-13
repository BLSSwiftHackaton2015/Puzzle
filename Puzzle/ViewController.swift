//
//  ViewController.swift
//  Puzzle
//
//  Created by Sebastian Jędruszkiewicz on 13/06/15.
//  Copyright (c) 2015 Hackaton. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var imagePicker = UIImagePickerController()
    
    var imageTable:[(image: UIImage,description: String)] = []
    
    
    @IBAction func addPhoto(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            let pickerC = UIImagePickerController()
            pickerC.delegate = self
            self.presentViewController(pickerC, animated: true, completion: nil)
        }
        
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let a = gotImage.description
        print(gotImage)
        imageTable.append((image:gotImage,description:a))
        self.tableView.reloadData()
        
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            imageTable.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
            // handle delete (by removing the data from your array and updating the tableview)
            
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return imageTable.count

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("photoTableCell") as! UITableViewCell
        var text = imageTable[indexPath.row].description
        var shortText = text.substringWithRange(Range<String.Index>(start: advance(text.startIndex, 10), end: advance(text.endIndex, -47)))
        cell.textLabel?.text = shortText
        cell.imageView?.image = imageTable[indexPath.row].image
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

