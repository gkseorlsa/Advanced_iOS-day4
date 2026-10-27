package com.thisweek.thisweek.service;

import com.thisweek.thisweek.domain.User;
import com.thisweek.thisweek.dto.LoginRequest;
import com.thisweek.thisweek.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public User getUser(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("유저를 찾을 수 없습니다."));
    }

    public User register(User user) {
        return userRepository.save(user);
    }

    public User login(LoginRequest request) {
        User find = userRepository.findByNickname(request.getNickname())
                .orElseThrow(() -> new RuntimeException("유저를 찾을 수 없습니다."));

        if (!find.getPassword().equals(request.getPassword())) {
            throw new RuntimeException("비밀번호가 일치하지 않습니다.");
        }

        System.out.println("로그인 성공: " + find.getNickname());

        return find;
    }
}
