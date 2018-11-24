//
//  Data.swift
//  Todoey
//
//  Created by Jorge Saraiva on 11/24/18.
//  Copyright © 2018 Jorge Saraiva. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var age: Int = 0
}
