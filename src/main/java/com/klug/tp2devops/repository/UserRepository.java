package com.klug.tp2devops.repository;

import com.klug.tp2devops.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
