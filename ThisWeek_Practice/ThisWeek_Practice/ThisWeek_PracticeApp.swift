//
//  ThisWeek_PracticeApp.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

@main
struct ThisWeek_PracticeApp: App {
    @State private var userVM = UserViewModel()
    @State private var matchVM = MatchViewModel()
    
    @State private var showLogin = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if userVM.isLoading {       // 앱이 로딩중일 때 로고 + ProgressView 표시
                    VStack {
                        Image("AppIcon")
                            .resizable()
                            .frame(width: 120, height: 120)
                        ProgressView()
                    }
                } else if userVM.isLoggedIn {
                    MainView()
                        .tint(.pink)
                } else {
                    if showLogin {
                        LoginView(showLogin: $showLogin)
                    } else {
                        RegisterView(showLogin: $showLogin)
                    }
                }
            }
            .environment(userVM)
            .environment(matchVM)
            .onAppear {
                userVM.autoLogin()      // 앱 호출 시 autoLogin() 자동 호출
                matchVM.fetchPhase()
            }
        }
    }
}
