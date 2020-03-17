package com.fatih.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.PullRequests;
import com.fatih.demo.model.User;
import com.fatih.demo.repository.PullRequestRepository;

@Service
public class PullRequestServiceImp implements PullRequestService{
	
	@Autowired
	private PullRequestRepository pullRequestRepository;
	
	@Autowired
	private ContentService contentServiceImpl;
	

	@Override
	public void save(User fromUser, User toUser, Content content, PullRequests pullRequest) {
		List<PullRequests> fromUserRequestsSentList=fromUser.getPullRequestsSent();
		fromUserRequestsSentList.add(pullRequest);
		fromUser.setPullRequestsSent(fromUserRequestsSentList);
		List<PullRequests> toUserRequestsReceivedList=toUser.getPullRequestsReceived();
		toUserRequestsReceivedList.add(pullRequest);
		toUser.setPullRequestsReceived(toUserRequestsReceivedList);
		List<PullRequests> contentRequests=content.getRequestsOfTheContent();
		contentRequests.add(pullRequest);
		content.setRequestsOfTheContent(contentRequests);
		pullRequestRepository.save(pullRequest);
		
	}

	@Override
	public void accept(String description,String userId) {
		PullRequests pR=findByDescription(description);
		contentServiceImpl.edit(pR.getContent(),userId);
		pullRequestRepository.deleteById(pR.getPullId());
	}

	@Override
	public void deny(String description) {
		PullRequests pR=findByDescription(description);
		pullRequestRepository.deleteById(pR.getPullId());
		
	}

	@Override
	public PullRequests findByDescription(String description) {
		return pullRequestRepository.findByDescription(description);
	}

}
