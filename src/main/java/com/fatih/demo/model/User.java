package com.fatih.demo.model;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;

    private String password;

    @Transient
    private String passwordConfirm;

    @ManyToMany
    private Set<Role> roles;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Content> contentList;
    
    @OneToMany(mappedBy = "toUser", cascade = CascadeType.ALL)
    private List<PullRequests> pullRequestsReceived;
    
    @OneToMany(mappedBy = "fromUser", cascade = CascadeType.ALL)
    private List<PullRequests> pullRequestsSent;

    public List<PullRequests> getPullRequestsReceived() {
		return pullRequestsReceived;
	}

	public void setPullRequestsReceived(List<PullRequests> pullRequestsReceived) {
		this.pullRequestsReceived = pullRequestsReceived;
	}

	public List<PullRequests> getPullRequestsSent() {
		return pullRequestsSent;
	}

	public void setPullRequestsSent(List<PullRequests> pullRequestsSent) {
		this.pullRequestsSent = pullRequestsSent;
	}

	public List<Content> getContentList() {
		return contentList;
	}

	public void setContentList(List<Content> contentList) {
		this.contentList = contentList;
	}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
