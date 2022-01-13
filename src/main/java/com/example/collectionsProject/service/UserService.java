package com.example.collectionsProject.service;

import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;
    @Override
    public UserDetails loadUserByUsername(String username) throws BadCredentialsException {
        User user = userRepo.findByUsername(username);
        if (user == null) {
            throw new BadCredentialsException("Username not found");
        }
        return user;
    }
}
