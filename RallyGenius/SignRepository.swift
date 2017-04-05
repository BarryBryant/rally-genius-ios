//
//  File.swift
//  RallyGenius
//
//  Created by Barry Bryant on 3/28/17.
//  Copyright © 2017 Barry Bryant. All rights reserved.
//

import Foundation

protocol SignRepository {
    func getSign(number: Int) -> Sign
    func getAllSigns() -> Array<Sign>
    func getSignsFor(rallyClass: RallyClass) -> Array<Sign>
    func getSignFor(indexPath: IndexPath) -> Sign
}

final class JSONSignRepository: SignRepository {
    
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
    
    public func getSign(number: Int) -> Sign {
        let stringNumber = "\(number)"
        let sign = signs.filter { $0.name == stringNumber }.first
        if let sign = sign { return sign }
        return Sign(name: "Error", description: "Error")
    }
    
    public func getAllSigns() -> Array<Sign> {
        return self.signs
    }
    
    public func getSignsFor(rallyClass: RallyClass) -> Array<Sign> {
        return self.signs.filter { $0.getClass() == rallyClass }
    }
    
    public func getSignFor(indexPath: IndexPath) -> Sign {
        let rallyClass = RallyClass(rawValue: indexPath.section)
        let signs = getSignsFor(rallyClass: rallyClass)
        let sign = signs[indexPath.item]
        return sign
    }
    
}
