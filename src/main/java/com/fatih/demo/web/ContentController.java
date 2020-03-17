package com.fatih.demo.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.User;
import com.fatih.demo.service.ContentService;
import com.fatih.demo.service.UserService;

@Controller
public class ContentController {
	
		@Autowired
		private UserService userService;
	
	 	@Autowired
	 	private ContentService contentService;
	 	
	 	
	 	 @GetMapping("/texteditor")
	     public String registration(ModelMap map) {
	 		 	map.addAttribute("saveContent", new Content());
	         return "texteditor";
	     }
	 	
	 	@PostMapping(value="/texteditor")
	 	public String saveContent(@ModelAttribute("saveContent") Content saveContent) {
	 		Authentication user=SecurityContextHolder.getContext().getAuthentication();
	 		String username=user.getName();
	 		User currentUser=userService.findByUsername(username);
	 		contentService.save(saveContent,currentUser);
	 		return "redirect:/welcome";
	 	}
	 	
	 	@GetMapping(value="/{profile}")
	 	public String getContents(@PathVariable("profile")String username,ModelMap map) {
	 		User currentUser=userService.findByUsername(username);
	 		List<String> contentTitle=currentUser.getContentList().stream()
	 				.map(x->x.getContentTitle()).
	 				collect(Collectors.toList());
	 		map.addAttribute("contentTitle", contentTitle);
	 		return "profile"; 		
	 	}
	 	
	 	@GetMapping(value="/{profile}/{contentTitle}")
	 	public String getContentPage(@PathVariable("profile")String username,@PathVariable("contentTitle") String contentT,ModelMap map) {
	 		User currentUser=userService.findByUsername(username);
	 		List<Content> contentList=currentUser.getContentList();
	 		for(Content content:contentList) {
	 			if (content.getContentTitle().equals(contentT)) {
	 				map.addAttribute("saveContent", content);
	 				return "editor";
	 			}
	 		}
	 		return "404";	 		
	 	}
	 	@PostMapping(value="/{profile}/{contentTitle}",params="submit")
	 	public String putContentPage(@PathVariable("profile")String username,@ModelAttribute("saveContent") Content saveContent,Model model,@PathVariable("contentTitle") String contentT,@PathVariable("profile")String userx) {
	 		Authentication user=SecurityContextHolder.getContext().getAuthentication();
	 		User currentUser=userService.findByUsername(username);
	 		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@" +currentUser.getId());
	 		String userId=""+currentUser.getId();
	 		if (username.equals(user.getName())) {
	 			contentService.edit(saveContent,userId);
	 			
		 		return "redirect:/welcome";
	 		} else {
	 			model.addAttribute("error", "You are not allowed to edit this file.\n You can fork the file and send a pull request the owner of the content.");
	 			return "editor";
	 		}
	 	}
	 	
	 	@PostMapping(value="/{profile}/{contentTitle}",params = "fork")
	 	public String forkContentToMyProfile(@PathVariable("contentTitle") String contentT,@PathVariable("profile")String userx,@ModelAttribute("saveContent") Content saveContent,ModelMap map) {
	 		Authentication currentUserAuthentication=SecurityContextHolder.getContext().getAuthentication();
	 		String currentUserName=currentUserAuthentication.getName();
	 		User currentUser=userService.findByUsername(currentUserName);
	 		contentService.save(saveContent,currentUser);
	 		return "redirect:/welcome"; 		
	 	}
	 	

}
