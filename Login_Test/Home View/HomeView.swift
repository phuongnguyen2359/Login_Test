//
//  HomeView.swift
//  Login_Test
//
//  Created by TT on 9/29/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            
            FirstTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            SecondTabView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
    }
}

struct FirstTabView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Home Screen")
                .font(.system(size: 24, weight: .medium))
            Spacer()
        }.edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(Color.red)
    }
}

struct SecondTabView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Setting Screen").font(.system(size: 24, weight: .medium))
            Spacer()
        }.edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(Color.blue)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
