//
//  Extensions.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 22/01/21.
//

import Foundation

/// Verify if a String is completely blank (i.e. if an user press spacebar multiple times)
extension String {
    func isBlankText() -> Bool {
        let count = self.count
        var blankString: String = ""
   
        if self.count > 0 {
            for _ in 0..<count {
                blankString += " "
            }
        }
        
        return self == blankString
    }
    
}
