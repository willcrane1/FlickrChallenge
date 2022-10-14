//
//  ParseString.swift
//  FlickrSearchProject
//
//  Created by WillC on 10/14/22.
//

import Foundation

extension String {
    func parse(for pattern: String) -> String {
        
        if let startIndex = self.range(of: pattern + "\"")?.upperBound {
            
            let trimmedString = self.suffix(from: startIndex)
            
            if let endIndex = trimmedString.range(of: "\"")?.lowerBound {
                return "\(trimmedString.prefix(upTo: endIndex))"
            }
        }
        return "ERROR: COULD NOT PROCESS STRING"
    }
}
