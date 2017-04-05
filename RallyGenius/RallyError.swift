//
//  RallyError.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

public enum RallyError: LocalizedError {
    
    case serializationError
    case invalidDataError
    
    public var errorDescription: String? {
        switch self {
        case .serializationError:
            return "An error occured during serialization."
        case .invalidDataError:
            return "The data being parsed was invalid"
        }
    }
}
