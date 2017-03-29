//
//  File.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

final class SignRepository {
    
    private var signs: Array<Sign>!
    
    init() {
        do {
            self.signs = try SignsSerialization.allSigns()
        } catch RallyError.serializationError {
            print("Failed to instantiate a repository, something went wrong with serializing the JSON")
        } catch {
            print("Something bad and unknown occured")
        }
    }
    
    public func getAllSigns() -> Array<Sign> {
        return self.signs
    }
}
