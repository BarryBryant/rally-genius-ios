//
//  SignsSerialization.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

final class SignsSerialization {
    
    private enum propertyKey: String, JSONPropertyKey {
        case signs
    }
    
    private static let rootPath = Bundle.main.url(forResource: "rally-genius", withExtension: "json")
    
    static func allSigns() throws -> Array<Sign> {
        guard let rootPath = SignsSerialization.rootPath else {
            throw RallyError.serializationError
        }
        let data = try Data(contentsOf: rootPath)
        return try SignsSerialization.signs(with: data)
    }
    
    static func signs(with data: Data) throws -> Array<Sign> {
        let dictionary = try JSONSerialization.jsonDictionary(with: data)
        return try signs(with: dictionary)
    }
    
    static func signs(with jsonDictionary: JSONDictionary) throws -> Array<Sign> {
        guard let signs: [JSONDictionary] = jsonDictionary.jsonValue(propertyKey.signs) else {
            throw RallyError.serializationError
        }
        
        return try signs.flatMap(SignSerialization.sign(with: ))
    }
}
