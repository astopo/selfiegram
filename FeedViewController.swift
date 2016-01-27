//
//  FeedViewController.swift
//  selfiegram
//
//  Created by stopo on 2016-01-19.
//  Copyright © 2016 stopo. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    
    let words = ["Hello", "my", "name", "is", "Selfiegram"]
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let me = User(username: "amy", profileImage: UIImage(named: "grumpy-cat")!)
        let post0 = Post(user: me, image: UIImage(named: "grumpy-cat")!, comment: "Hey this is Grumpy Cat 0")
        let post1 = Post(user: me, image: UIImage(named: "grumpy-cat")!, comment: "Hey this is Grumpy Cat 1")
        let post2 = Post(user: me, image: UIImage(named: "grumpy-cat")!, comment: "Hey this is Grumpy Cat 2")
        let post3 = Post(user: me, image: UIImage(named: "grumpy-cat")!, comment: "Hey this is Grumpy Cat 3")
        let post4 = Post(user: me, image: UIImage(named: "grumpy-cat")!, comment: "Hey this is Grumpy Cat 4")
        
        posts = [post0, post1, post2, post3, post4]
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
        return words.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell", forIndexPath: indexPath) as! SelfieCell

        let post = self.posts[indexPath.row]
        cell.selfieImageView.image = post.image
        print(post.user.username)
        print(indexPath.row)
        cell.usernameLabel.text = post.user.username
        cell.commentLabel.text = post.comment

        return cell
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
