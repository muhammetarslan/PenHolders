package com.fatih.demo.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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
	 	public String saveContent(@ModelAttribute("saveContent") Content saveContent,BindingResult bindingResult) {
	 		if (bindingResult.hasErrors()) return "texteditor";
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
	 	@PostMapping(value="/{profile}/{contentTitle}")
	 	public String putContentPage(@PathVariable("profile")String username,@ModelAttribute("saveContent") Content saveContent,Model model) {
	 		Authentication user=SecurityContextHolder.getContext().getAuthentication();
	 		if (username.equals(user.getName())) {
	 			contentService.edit(saveContent);
		 		return "redirect:/welcome";
	 		} else {
	 			model.addAttribute("error", "You are not allowed to edit this file.\n You can fork the file and send a pull request the owner of the content.");
	 			return "editor";
	 		}
	 		
	 		
	 	}

}
