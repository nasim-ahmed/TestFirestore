//
//  User.swift
//  TestFirestore
//
//  Created by Nasim on 2/6/18.
//  Copyright © 2018 Nasim. All rights reserved.
//

import Foundation
protocol Identifiable{
    var id:String? {get set}
}

struct User: Codable, Identifiable{
    var id: String? = nil
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
