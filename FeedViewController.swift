//
//  FeedViewController.swift
//  selfiegram
//
//  Created by stopo on 2016-01-19.
//  Copyright © 2016 stopo. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var posts = [Post]()
    
    @IBAction func doubleTappedSelfie(sender: UITapGestureRecognizer) {
        print("DOUBLE TAPPED")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "doubleTappedSelfie:")
        tapGesture.numberOfTapsRequired = 2
        tableView.addGestureRecognizer(tapGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! SelfieCell
        

        let post = self.posts[indexPath.row]
        cell.post = post

        return cell
    }

    @IBAction func cameraButtonPressed(sender: AnyObject) {
        // 1. Create an ImagePickerController
        let pickerController = UIImagePickerController()
        
        // 2: Self in this line refers to this View Controller
        //  Setting the Delegate Property means you want to receive a message from pickerController when a specific event is triggered.
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            // 3. We check if we are funning on a Simulator
            //    If so, we pick a photo from the simulator's Photo Library. We need to do this because the simlator does not have a camera
            pickerController.sourceType = .PhotoLibrary
        } else {
            pickerController.sourceType = .Camera
            pickerController.cameraDevice = .Front
            pickerController.cameraCaptureMode = .Photo
        }
        
        self.presentViewController(pickerController, animated: true, completion: nil)

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            // setting the compression quality to 90%
            if let imageData = UIImageJPEGRepresentation(image, 0.9),
                let imageFile = PFFile(data: imageData),
                let user = PFUser.currentUser(){
                    
                    //2. We create a Post object from the image
                    let post = Post(image: imageFile, user: user, comment: "A Selfie")
                    
                    post.saveInBackgroundWithBlock({ (success, error) -> Void in
                        if success {
                            print("Post successfully saved in Parse")
                            
                            self.posts.insert(post, atIndex: 0)
                            
                            //4. Now that we have added a post, updating our table
                            //   We are just inserting our new Post instead of reloading our whole tableView
                            //   Both method would work, however, this gives us a cool animation for free
                            
                            let indexPath =  NSIndexPath(forRow: 0, inSection: 0)
                            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                            
                        }
                    })
            }
        }
        
        //3. We remember to dismiss the Image Picker from our screen.
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func refreshPulled(sender: AnyObject) {
        print("REFRESH!")
        getPosts()
    }
    
    func getPosts() {
        
        if let query = Post.query() {
            query.orderByDescending("createdAt")
            query.includeKey("user")
            query.findObjectsInBackgroundWithBlock({ (posts, error) -> Void in
                if let posts = posts as? [Post]{
                    self.posts = posts
                    self.tableView.reloadData()
                    // remove the spinning circle if needed
                    self.refreshControl?.endRefreshing()
                }
            })
        }

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
