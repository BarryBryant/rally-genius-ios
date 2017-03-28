//
//  SignSerialization.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

final class SignSerialization {
    
    private enum propertyKey: String, JSONPropertyKey {
        case name
        case description
    }
    
    static func sign(with jsonDictionary: JSONDictionary) throws -> Sign {
        return Sign(name: jsonDictionary.jsonValue(propertyKey.name)!, description: jsonDictionary.jsonValue(propertyKey.description)!)
    }
}
