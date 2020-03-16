package com.fatih.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="content")
public class Content {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "content_id")
	private long content_id;
	
	@ManyToOne
	@JoinColumn(name = "id", nullable=false)
	private User user;

	@Lob
	private String content;
	
	@Column(name="contentTitle")
	private String contentTitle;
	
	public String getContentTitle() {
		return contentTitle;
	}

	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	public long getContent_id() {
		return content_id;
	}

	public void setContent_id(long content_id) {
		this.content_id = content_id;
	}



	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	
	
	
}
