//
//  UserViewModel.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/26/26.
//

import SwiftUI

@Observable
class UserViewModel {
    private(set) var currentUser: User? = nil
    var isLoading = false
    
    var isLoggedIn: Bool {
        currentUser != nil
    }
    
    var savedUserId: Int {
        get { UserDefaults.standard.integer(forKey: "userId") }     // 값이 없으면 0 반환
        set { UserDefaults.standard.set(newValue, forKey: "userId") }
    }
    
    func register(
        nickname: String,
        password: String,
        age: Int,
        gender: Gender,
        mbti: String,
        job: String,
        hobby: String,
        image: UIImage
    ) {
        UserApi.register(
            nickname: nickname,
            password: password,
            age: age,
            gender: gender.rawValue,
            mbti: mbti,
            job: job,
            hobby: hobby,
            image: image
        ) { user in
            self.currentUser = user     // API 성공 시 currentUser에 저장 -> 자동으로 메인 화면으로 전환
            self.savedUserId = user.id
        }
    }
    
    func logout() {
        currentUser = nil
        savedUserId = 0
    }
    
    func login(nickname: String, password: String) {
        UserApi.login(
            nickname: nickname,
            password: password
        ) { user in
            print("ViewModel에서 받은 사용자: ", String(describing: user))
            
            self.currentUser = user
            
            if let user {
                self.savedUserId = user.id
                print("로그인 상태: ", self.isLoggedIn)
            }
        }
    }
    
    func autoLogin() {
        print("자동 로그인 시작")
        print("저장된 사용자 ID: \(savedUserId)")
        
        guard savedUserId != 0 else {   // 서버에 저장된 userId가 없다면 오토로그인 false
            print("저장된 사용자 ID가 없음")
            isLoading = false
            return
        }
        
        isLoading = true
        
        UserApi.getById(id: savedUserId) { user in
            print("사용자 조회 응답: \(String(describing: user))")
            
            self.currentUser = user     // 성공 시 currentUser 설정
            self.isLoading = false      // 자동으로 메인 화면 전환
            
            print("로딩 종료: \(self.isLoading)")
        }
    }
}
