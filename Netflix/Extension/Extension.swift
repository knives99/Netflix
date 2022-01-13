//
//  Extension.swift
//  Netflix
//
//  Created by Bryan on 2022/1/11.
//

import Foundation

extension String{
    
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
