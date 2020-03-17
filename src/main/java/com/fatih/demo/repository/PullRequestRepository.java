package com.fatih.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fatih.demo.model.PullRequests;

public interface PullRequestRepository extends JpaRepository<PullRequests, Long>{
	PullRequests findByDescription(String decription);
}
