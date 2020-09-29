//
//  LoginError.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import Foundation

enum LoginError: Error {
    case parsing(description: String)
    case network(description: String)
}
