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
        case number
        case description
    }
    
    static func sign(with jsonDictionary: JSONDictionary) throws -> Sign {
        guard let signNumber: Int = jsonDictionary.jsonValue(propertyKey.number) else { throw RallyError.invalidDataError }
        return Sign(signNumber: signNumber, description: jsonDictionary.jsonValue(propertyKey.description)!)
    }
}
