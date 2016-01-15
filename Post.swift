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
    var image: UIImage
    var comment: String
    
    init(user: User, image: UIImage, comment: String) {
        self.user = user
        self.image = image
        self.comment = comment
    }
}