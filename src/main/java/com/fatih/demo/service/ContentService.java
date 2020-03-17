package com.fatih.demo.service;


import java.util.List;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.User;


public interface ContentService {
	void save(Content newContent,User user);
	List<Content> getContent(User user);
	void edit(Content newContent,String userId);
//	List<Content> findContentByTitle(String contentTitle);
}
