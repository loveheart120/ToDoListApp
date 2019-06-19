//
//  Item.swift
//  ToDoListApp
//
//  Created by Natasha Rajpar on 24/05/2019.
//  Copyright © 2019 Natasha Rajpar. All rights reserved.
//

import Foundation

class Item: Codable {
    var title: String = ""
    var done: Bool = false
    
    
}
// must be all standard data types or will no be encodable 
