//
//  Sign.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

enum RallyClass: Int {
    case novice = 0
    case intermediateAndAdvanced = 1
    case excellent = 2
    case master = 3
    case error = 999
    
    var name: String {
        switch self {
        case .novice:
            return "Novice"
        case .intermediateAndAdvanced:
            return "Intermediate and Advanced"
        case .excellent:
            return "Excellent"
        case .master:
            return "Master"
        case .error:
            return "Error initializing sign"
        }
    }
    
    init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .novice
        case 1:
            self = .intermediateAndAdvanced
        case 2:
            self = .excellent
        case 3:
            self = .master
        default:
            self = .error
            
        }
    }
}

struct Sign {
    let number: Int
    let description: String
    
    init(signNumber: Int, description: String) {
        self.number = signNumber
        self.description = description
    }
    
    func getClass() -> RallyClass {
        if self.number > 0 {
            return RallyClass(rawValue: self.number / 100)
        } else { return .error }
    }
}
