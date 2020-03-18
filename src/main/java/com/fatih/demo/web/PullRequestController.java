package com.fatih.demo.web;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fatih.demo.model.Content;
import com.fatih.demo.model.PullRequests;
import com.fatih.demo.model.User;
import com.fatih.demo.service.ContentService;
import com.fatih.demo.service.PullRequestService;
import com.fatih.demo.service.UserService;

@Controller
public class PullRequestController {
	
	@Autowired
	private PullRequestService pullRequestService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContentService contentService;
	

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
    	Authentication currentUserAuthentication=SecurityContextHolder.getContext().getAuthentication();
 		String currentUserName=currentUserAuthentication.getName();
 		User currentUser=userService.findByUsername(currentUserName);
 		List<PullRequests> pullRequestObjects=currentUser.getPullRequestsReceived();
 		List<String> pullRequests=pullRequestObjects.stream().map(x->x.getDescription()).collect(Collectors.toList());
		System.out.println(currentUserName+" requested, pullrequests "+pullRequests);
    	model.addAttribute("pullRequests",pullRequests);
        return "welcome";
    }
    
    @GetMapping(value="/pullRequests/{pullRequest}")
    public String getPullRequests(@PathVariable("pullRequest") String description,Model model) {
    	
    	PullRequests pR=pullRequestService.findByDescription(description);
    	model.addAttribute("content", pR.getContent().getContent());
    	model.addAttribute("fromUser", pR.getFromUser().getUsername());
    	model.addAttribute("contentTitle", pR.getContent().getContentTitle());
    	return "pullrequest";
    }
    
    @PostMapping(value="/pullRequests/{pullRequest}",params="accept")
    public String acceptPullRequest(@PathVariable("pullRequest") String description) {
    	Authentication currentUserAuthentication=SecurityContextHolder.getContext().getAuthentication();
 		String currentUserName=currentUserAuthentication.getName();
 		User currentUser=userService.findByUsername(currentUserName);
    	pullRequestService.accept(description,""+currentUser.getId());
    	return "redirect:/welcome";   	
    }
    @PostMapping(value="/pullRequests/{pullRequest}",params="deny")
    public String denyPullRequest(@PathVariable("pullRequest") String description) {
    	pullRequestService.deny(description);
    	return "redirect:/welcome";   	
    }
    @PostMapping(value="/{profile}/{contentTitle}/search*")
    public String sendPullRequest(@RequestParam(value="userX") String toUserName,@RequestParam(value="description")String description,HttpServletRequest request) {
    	String url=request.getRequestURI();
    	String arr[]=url.split("/");
    	String fromUserName=arr[1];
    	String contentTitle=arr[2].replace("%20"," ");
    	System.out.println("burasi:  "+fromUserName+" ve "+contentTitle);
    	User fromUser=userService.findByUsername(fromUserName);
    	User toUser=userService.findByUsername(toUserName);
    	List<Content> fromUserContentList=fromUser.getContentList();
    	Content content=null;
    	for (Content c:fromUserContentList) {
    		if (c.getContentTitle().equals(contentTitle)) {
    			content=c;
    		}
    	}
    	PullRequests pullrequest=new PullRequests();
    	pullrequest.setAccepted(false);
    	pullrequest.setContent(content);
    	pullrequest.setDescription(description);
    	pullrequest.setFromUser(fromUser);
    	pullrequest.setToUser(toUser);
    	pullRequestService.save(fromUser, toUser, content, pullrequest);
    	return "redirect:/welcome"; 
    	
    }
}
