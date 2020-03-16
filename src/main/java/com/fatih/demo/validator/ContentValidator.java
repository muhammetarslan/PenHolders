package com.fatih.demo.validator;

import org.springframework.validation.Validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import com.fatih.demo.model.Content;
import com.fatih.demo.model.User;

@Component
public class ContentValidator implements Validator {
	
	@Override
    public boolean supports(Class<?> aClass) {
        return Content.class.equals(aClass);
    }
	
	  @Override
	    public void validate(Object o, Errors errors) {
	        Content contentObject = (Content) o;
	        String content=contentObject.getContent();
//	        Authentication user=SecurityContextHolder.getContext().getAuthentication();
	        ValidationUtils.rejectIfEmpty(errors, "content", "NotEmpty");
	        if (content.length() < 1 || content.length() > 300) {
	            errors.rejectValue("contentObject", "Size.newContent.content");
	        }
//	        if (!contentObject.getUser().getUsername().equals(user.getName())) {
//	        	errors.reject("contentObject", "EditingUnauthorizedContent");
//	        }
	    }
	  
	  public void validateUser(User user,Content contentObject, Errors errors) {
	        if (!contentObject.getUser().getUsername().equals(user.getUsername())) {
	        	errors.reject("contentObject", "EditingUnauthorizedContent");
	        }
	    }


}
