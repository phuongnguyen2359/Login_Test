//
//  UserDefaultsExtension.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import Foundation

extension UserDefaults {
    var accessToken: String? {
        get {
            if let result = value(forKey: #function) as? String {
                return result
            }
            return nil
        }
        set { set(newValue, forKey: #function) }
    }
}
