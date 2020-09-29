//
//  LoginView.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            sloganView
            loginView
            Spacer()
        }.padding(.top, 60)
    }
}

extension LoginView {
    var sloganView: some View {
        Text("Welcome KANTEK - INC")
            .font(.system(size: 24, weight: .bold))
    }
    
    var loginView: some View {
        VStack(spacing: 40) {
            Text("Login")
                .font(.system(size: 24, weight: .medium))
                .padding(.top, 60)
            
            TextField("Email:", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())

            loginButton
        }.padding(.horizontal, 40)
    }
    
    var loginButton: some View {
        Button {
            viewModel.login()
        } label: {
            Text("Login")
                .frame(width: 240, height: 40)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(20)
        }
        .fullScreenCover(isPresented: $viewModel.presentHomeScreen) {
            HomeView()
        }.alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error !!"), message: Text("Please check email and password again"), dismissButton: .default(Text("Ok")))
        }
    }
}
