//
//  ProfileCard.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct ProfileCard: View {
    let user: User
    @Binding var isBlurred: Bool
    @State private var showAlert = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // 이미지
            Color.clear
                .frame(maxWidth: .infinity)
                .frame(height: 500)
                .overlay {
                    AsyncImage(url: URL(string: "\(ApiClient.baseURL)/api/users/\(user.id)/image"
                                       )) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .blur(radius: isBlurred ? 10 : 0)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // 그라데이션
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .center,
                endPoint: .bottom
            )
            .frame(maxWidth: .infinity)
            .frame(height: 500)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // 텍스트
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 8) {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(user.nickname)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("\(user.age)")
                            .font(.title2)
                    }
                    
                    Text("NEW")
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Text("mbti: \(user.mbti)")
                Text("직업: \(user.job)")
                Text("취미: \(user.hobby)")
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .padding()
        }
        .shadow(radius: 10)
        .overlay(alignment: .topTrailing) {
            Button {
                showAlert = true
            } label: {
                Image(systemName: "lock.fill")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.black.opacity(0.5))
                    .clipShape(Circle())
            }
        }
        .alert("사진 공개", isPresented: $showAlert) {
            Button("공개하기") {
                isBlurred.toggle()
            }
            
            Button("취소", role: .cancel) {}
        } message: {
            Text("상대방의 프로필 사진을 공개하시겠습니까?")
        }
    }
}

#Preview("블러 O") {
    ProfileCard(
        user: User(
            id: 1,
            nickname: "오카리나",
            age: 22,
            gender: .female,
            mbti: "INFP",
            job: "가수",
            hobby: "노래",
            imagePath: nil,
            point: 0
        ),
        isBlurred: .constant(true)
    )
        .padding()
}


#Preview("블러 X") {
    ProfileCard(
        user: User(
            id: 1,
            nickname: "오카리나",
            age: 22,
            gender: .female,
            mbti: "INFP",
            job: "가수",
            hobby: "노래",
            imagePath: nil,
            point: 0
        ),
        isBlurred: .constant(false)
    )
        .padding()
}
