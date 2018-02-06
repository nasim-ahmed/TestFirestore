//
//  Snapshot Extensions.swift
//  TestFirestore
//
//  Created by Nasim on 2/6/18.
//  Copyright © 2018 Nasim. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

extension DocumentSnapshot{
    
    func decode<T: Decodable>(as objectType: T.Type, includingId: Bool = true) throws -> T{
        var documentJson = data()
        if includingId{
            documentJson!["id"] = documentID
        }
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodedObject
        
    }
    
}
