package com.wilsonbluong.javaproject.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="songs")
public class Song {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min = 1, max = 30, message="Title must be present")
	private String title;
	
	@Size(min = 1, max = 30, message="Artist must be present")
	private String artist;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
	public Song() {
	}
	
	public Song(Long id, String title, String artist) {
		this.id = id;
		this.title = title;
		this.artist = artist;
	}

	//Getters
	public Long getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getArtist() {
		return artist;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public User getUser() {
		return user;
	}
	
	//Setters
	public void setId(Long id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}	
	public void setUser(User user) {
		this.user = user;
	}
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
