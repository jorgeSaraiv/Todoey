//
//  Item.swift
//  Todoey
//
//  Created by Jorge Saraiva on 11/24/18.
//  Copyright © 2018 Jorge Saraiva. All rights reserved.
//

import Foundation
import RealmSwift


class Item: Object {
    @objc dynamic  var title : String = ""
    @objc dynamic  var done : Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
