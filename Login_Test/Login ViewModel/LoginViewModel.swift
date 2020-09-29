//
//  LoginViewModel.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var presentHomeScreen: Bool = false
    @Published var showErrorAlert: Bool = false

    private let authProvider: AuthProvider
    private var disposables = Set<AnyCancellable>()
        
    
    init(authProvider: AuthProvider, scheduler: DispatchQueue = DispatchQueue(label: "loginViewModel")) {
        self.authProvider = authProvider
      
    }
    
    func login() {
        authProvider.login(email: email.lowercased(), password: password)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.showErrorAlert = true
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] loginResponse in
                    guard let self = self else { return }
                    UserDefaults.standard.accessToken = loginResponse.data.accessToken
                    self.presentHomeScreen = true
                })
            .store(in: &disposables)
    }
}
