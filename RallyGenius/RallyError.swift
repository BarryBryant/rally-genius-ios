//
//  RallyError.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

public enum RallyError: Error, CustomStringConvertible {
    
    case serializationError
    
    public var description: String {
        switch self {
        case .serializationError:
            return NSLocalizedString("An error occured during serialization.", comment: "Something went wrong serializing JSON")
        }
    }
}
