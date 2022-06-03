package com.example.blog.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Post {
    private int id;
    private User userId;
    private String title;
    private String description;
    private String content;
    private LocalDateTime postDate;
    private int status;

    public Post() {
    }

    public Post(User userId, String title, String description, String content, LocalDateTime postDate, int status) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.content = content;
        this.postDate = postDate;
        this.status = status;
    }

    public Post(int id, User userId, String title, String description, String content, LocalDateTime postDate, int status) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.content = content;
        this.postDate = postDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDateTime postDate) {
        this.postDate = postDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
