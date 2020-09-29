//
//  LoginRespone.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import Foundation


struct LoginResponse: Codable {
    
    var result: Bool
    var message: String
    var data: UserInfo
    
    
    enum CodingKeys: String, CodingKey {
        case result
        case message
        case data
    }
}

struct UserInfo: Codable {
    let name: String
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case name
        case accessToken = "access_token"
    }

}
