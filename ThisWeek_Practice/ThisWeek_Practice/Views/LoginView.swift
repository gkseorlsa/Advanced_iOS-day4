//
//  LoginView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/23/26.
//

import SwiftUI

struct LoginView: View {
    @Environment(UserViewModel.self) var userVM

    @Binding var showLogin: Bool
    
    @State private var nickname = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            // 로고
            Image(.appIcon)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("WeekOne")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.pink)
            
            // 입력 필드
            TextField("닉네임", text: $nickname)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            
            SecureField("비밀번호", text: $password)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            
            // 버튼
            Button {
                userVM.login(nickname: nickname, password: password)
            } label: {
                Text("로그인")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Button {
                showLogin = false
            } label: {
                Text("계정이 없으신가요? 회원가입")
                    .font(.subheadline)
                    .foregroundColor(.pink)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    LoginView(showLogin: .constant(true))
}
