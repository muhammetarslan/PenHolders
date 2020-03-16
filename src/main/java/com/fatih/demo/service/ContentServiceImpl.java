package com.fatih.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.User;
import com.fatih.demo.repository.ContentRepository;

@Service
public class ContentServiceImpl implements ContentService{

	
	@Autowired
	private ContentRepository contentRepository;
	
	@Override
	public void save(Content newContent,User user) {		
		List<Content> userContent=user.getContentList();
		userContent.add(newContent);
		user.setContentList(userContent);
		newContent.setUser(user);
		contentRepository.save(newContent);
		
	}

	@Override
	public List<Content> getContent(User user) {
		List<Content> contentList=user.getContentList();
		return contentList;
	}

	@Override
	public void edit(Content newContent) {
		contentRepository.edit(newContent.getContentTitle(), newContent.getContent());		
	}

	

	

	
}
