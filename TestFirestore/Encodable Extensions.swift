//
//  Encodable Extensions.swift
//  TestFirestore
//
//  Created by Nasim on 2/6/18.
//  Copyright © 2018 Nasim. All rights reserved.
//

import Foundation

enum DataError: Error{
    case EncodingError
}

extension Encodable{
    
    func toJson(excluding keys: [String] = [String]()) throws -> [String: Any]{
        let objectsData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: objectsData, options: [])
        guard var json = jsonObject as? [String: Any] else{throw DataError.EncodingError}
        
        for key in keys{
            json[key] = nil
        }
        
        return json
        
    }
}
