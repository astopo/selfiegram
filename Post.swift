//
//  Post.swift
//  selfiegram
//
//  Created by stopo on 2016-01-14.
//  Copyright © 2016 stopo. All rights reserved.
//

import Foundation
import UIKit

class Post {
    var user: User
    let imageURL:NSURL
    var comment: String
    
    init(user: User, imageUrl: NSURL, comment: String) {
        self.user = user
        self.imageURL = imageUrl
        self.comment = comment
    }
}