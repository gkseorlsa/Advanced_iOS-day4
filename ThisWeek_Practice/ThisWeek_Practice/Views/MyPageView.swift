//
//  MyPageView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct MyPageView: View {
    @Environment(UserViewModel.self) var userVM
    
//    let user = User(
//        id: 1,
//        nickname: "홍길동",
//        age: 20,
//        gender: .male,
//        mbti: "ENFP",
//        job: "학생",
//        hobby: "코딩",
//        imagePath: nil
//    )
    
    var body: some View {
        if let user = userVM.currentUser {
            ScrollView {
                VStack(spacing: 0) {
                    // 커버
                    ZStack(alignment: .bottom) {
                        LinearGradient(
                            colors: [.pink, .pink.opacity(0.3)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 160)
                        
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.pink)
                            .background(Color.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4)
                            )
                            .offset(y: 60)
                    }
                    
                    // 이름, 나이
                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            Text(user.nickname)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("\(user.age)")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.top, 70)
                    
                    // 정보 카드
                    VStack(spacing: 0) {
                        infoRow(icon: "person.fill", label: "성별", value: user.gender.label)
                        Divider()
                        infoRow(icon: "briefcase", label: "직업", value: user.job)
                        Divider()
                        infoRow(icon: "heart.fill", label: "취미", value: user.hobby)
                    }
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    
                    // 로그아웃 버튼
                    Button {
                        userVM.logout()
                    } label: {
                        Text("로그아웃")
                            .foregroundColor(.red)
                    }
                    .padding(.top, 20)
                }
            }
        } else {
            Text("로그인이 필요합니다.")
        }
    }
    
    func infoRow(
        icon: String,
        label: String,
        value: String
    ) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.pink)
                .frame(width: 24)
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
        .padding()
    }
}



#Preview {
    MyPageView()
}
