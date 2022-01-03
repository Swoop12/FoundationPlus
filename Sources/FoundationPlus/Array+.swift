//
//  Array+.swift
//  Taro
//
//  Created by DevMountain on 1/5/21.
//

import Foundation

public extension Array {
    
    /// Returns an array of elements combining the contents of the input to the end of the new array (non mutating)
    /// - Parameter contentsOf: The array to append ot the end
    /// - Returns: Returns a new combined array
    func appending(contentsOf: [Element]) -> [Element] {
        var copy = self
        copy.append(contentsOf: contentsOf)
        return copy
    }
}
