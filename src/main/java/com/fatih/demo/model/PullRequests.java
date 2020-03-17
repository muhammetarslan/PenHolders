package com.fatih.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.Nullable;

@Entity
@Table(name="pullrequests")
public class PullRequests {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="pull_id")
	private long PullId;

	@Nullable
	@Column(name="accepted")
	private boolean accepted;
	
	@Column(name="description")
	private String description;


	@ManyToOne
	@JoinColumn(name = "from_user_id", nullable=false)
	private User fromUser;
	
	@ManyToOne
	@JoinColumn(name = "to_user_id", nullable=false)
	private User toUser;
	
	@ManyToOne
	@JoinColumn(name = "content_id", nullable=false)
	private Content content;
	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isAccepted() {
		return accepted;
	}

	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
	
	public long getPullId() {
		return PullId;
	}

	public void setPullId(long pullId) {
		PullId = pullId;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

}
