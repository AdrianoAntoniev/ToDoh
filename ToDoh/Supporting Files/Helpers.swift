//
//  Extensions.swift
//  ToDoh
//
//  Created by Adriano Rodrigues Vieira on 22/01/21.
//

import SwiftUI
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

struct SchrinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(100)
            .scaleEffect(configuration.isPressed ? 1.3 : 1)
    }
}
