package com.thisweek.thisweek.controller;

import com.thisweek.thisweek.domain.User;
import com.thisweek.thisweek.dto.LoginRequest;
import com.thisweek.thisweek.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class UserController {
    private final UserService userService;

    @GetMapping("/users/{id}")
    public User getUser(@PathVariable Long id) {
        return userService.getUser(id);
    }

    @PostMapping(
            value = "/users",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE
    )
    public User register(
            @ModelAttribute User user,
            @RequestParam(value = "image", required = true) MultipartFile image
    ) {
        return userService.register(user, image);
    }

    @PostMapping("/users/login")
    public User login(@RequestBody LoginRequest request) {
        System.out.println("로그인 컨트롤러 진입");
        System.out.println("nickname: " + request.getNickname());
        return userService.login(request);
    }
}
