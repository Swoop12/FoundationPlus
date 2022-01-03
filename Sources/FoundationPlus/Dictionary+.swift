//
//  Dictionary+.swift
//  Taro
//
//  Created by DevMountain on 5/9/21.
//

import Foundation

public extension Dictionary {
    
    mutating func add<T>(_ element: T, toArrayOnKey key: Key) where Value == [T] {
        if self[key] == nil {
            self[key] = [element]
        } else {
            self[key]?.append(element)
        }
    }
    
}
