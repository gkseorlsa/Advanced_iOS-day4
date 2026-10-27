//
//  MainView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            TabView {
                MatchView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("매칭")
                    }
                
                MyPageView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("마이페이지")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("소개팅")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: {
                        Image(systemName: "bell.fill")
                    }
                    .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
