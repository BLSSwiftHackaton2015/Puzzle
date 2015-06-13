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
        sliceImage(gotImage)
        
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
        }
    }

    func sliceImage(inputImage: UIImage) -> [UIImage] {
        var outputArray: [UIImage] = []
        let contextImage: UIImage = UIImage(CGImage: inputImage.CGImage)!
        let contextSize: CGSize = contextImage.size
        
        let posX: CGFloat
        let posY: CGFloat
        let width: CGFloat
        let height: CGFloat
        
        // Check to see which length is the longest and create the offset based on that length, then set the width and height for our rect
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            width = contextSize.height
            height = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            width = contextSize.width
            height = contextSize.width
        }
        
        var smallRect: CGRect = CGRectMake(posX, posY, width, height) //big cropping rectangle
        let smallWidth = floor(width/3)
        let smallHeight = floor(height/3)
        
        for i in 0...7 {
            //var smallRect : CGRect?
            
            switch i {
            case 0,1,2:
                smallRect = CGRectMake((posX+(CGFloat(i)*smallWidth)), posY , smallWidth, smallHeight)
            case 3,4,5:
                smallRect = CGRectMake((posX+(CGFloat(i-3)*smallWidth)), (posY+CGFloat(smallHeight)) , smallWidth, smallHeight)
            case 6,7,8:
                smallRect = CGRectMake((posX+(CGFloat(i-6)*smallWidth)), (posY+CGFloat(2*smallHeight)) , smallWidth, smallHeight)
            default:
                print("error")
            }
            
            let imageRef: CGImageRef = CGImageCreateWithImageInRect(contextImage.CGImage, smallRect)
            
            let croppedImage: UIImage = UIImage(CGImage: imageRef, scale: inputImage.scale, orientation: inputImage.imageOrientation)!
            
            outputArray.append(croppedImage)
        }
        return outputArray
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

