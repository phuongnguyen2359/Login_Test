//
//  LoginFetcher.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import Foundation
import Combine

protocol AuthProvider {
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, LoginError>
}

class LoginFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension LoginFetcher: AuthProvider {
    
    func login(email: String, password: String) -> AnyPublisher<LoginResponse, LoginError> {
        return post(api: .logIn(email: email, password: password))
    }
    
    private func post<T>(api: API) -> AnyPublisher<T, LoginError> where T: Decodable {
        guard let url = URL(string: api.urlString) else {
            let error = LoginError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        guard let encoded = try? JSONEncoder().encode(api.httpBody) else {
            let error = LoginError.parsing(description: "Encode user data error")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }    
}
