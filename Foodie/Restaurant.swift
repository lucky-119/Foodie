//
//  Restaurant.swift
//  Foodie
//
//  Created by Lakshay Arora on 10/09/17.
//  Copyright © 2017 Lakshay Arora. All rights reserved.
//

import Foundation

class Restaurant
{
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var phone = ""
    var isVisited = false
    var rating = ""
    
    init(name: String, type: String, location: String, phone: String, image: String, isVisited: Bool)
    {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}

 
