//
//  API.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import Foundation

enum API {
    case logIn(email: String, password: String)
    var apiPath: String {
        switch self {
        case .logIn: return "/user/login"
        }
    }
    
    var urlString: String {
        switch self {
        case .logIn:
            return NetworkConfiguration.apiUrlString(self)
        }
    }
    
    
    var apiVersionPath: String {
        switch self {
        // Authentication
        case .logIn: return "/api/v1"
        }
    }
    
    var httpBody: CredentialsFormat {
        switch self {
        case let .logIn(email, password):
            return CredentialsFormat(email: email, password: password)
        }
    }
}


struct NetworkConfiguration {
    static let baseURL = "https://yelp-test.kennjdemo.com"
    
    static func apiUrlString(_ apiType: API) -> String {
        return self.baseURL + apiType.apiVersionPath + apiType.apiPath
    }
}

struct CredentialsFormat: Codable {
    var email: String
    var password: String    
}
