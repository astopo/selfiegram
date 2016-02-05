//
//  SelfieCell.swift
//  selfiegram
//
//  Created by stopo on 2016-01-26.
//  Copyright © 2016 stopo. All rights reserved.
//

import UIKit

class SelfieCell: UITableViewCell {

    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var post:Post? {
        
        // didSet is run when we set this variable in FeedViewController
        didSet{
            if let post = post {
                
                // I've added the below line to prevent flickering of images
                // This always resets the image to blank, waits for the image to download, and then sets it
                selfieImageView.image = nil
                
                let imageFile = post.image
                imageFile.getDataInBackgroundWithBlock { (data, error) -> Void in
                    if let data = data {
                        let image = UIImage(data: data)
                        self.selfieImageView.image = image
                    }
                }
                
                usernameLabel.text = post.user.username
                commentLabel.text = post.comment
                
            }
        }
    }
    
    @IBAction func likeButtonClicked(sender: UIButton) {
        // the ! symbol means NOT
        // We are therefore setting the button's selected state to
        // the opposite of what it was. This is a great way to toggle
        // a button from on to off and visa-versa
        sender.selected = !sender.selected
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
