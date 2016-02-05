//
//  Post.swift
//  selfiegram
//
//  Created by stopo on 2016-01-14.
//  Copyright © 2016 stopo. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Activity: PFObject, PFSubclassing {
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    static func parseClassName() -> String {
        return "Activity"
    }
    
    convenience init(type:String, post:Post, user:PFUser){
        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
}