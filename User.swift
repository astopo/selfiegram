//
//  User.swift
//  selfiegram
//
//  Created by stopo on 2016-01-14.
//  Copyright © 2016 stopo. All rights reserved.
//

import Foundation
import UIKit

class User {
    var username: String
    var profileImage: UIImage
    
    init(username: String, profileImage: UIImage) {
        self.username = username
        self.profileImage = profileImage
    }
}