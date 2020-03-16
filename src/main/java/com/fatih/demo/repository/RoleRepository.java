package com.fatih.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fatih.demo.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
