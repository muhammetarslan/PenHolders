package com.fatih.demo.service;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.PullRequests;
import com.fatih.demo.model.User;

public interface PullRequestService {
	
	void save(User fromUser,User toUser,Content content,PullRequests pullRequest);
	void accept(String description,String userId);
	void deny(String description);
	PullRequests findByDescription(String description);
}
