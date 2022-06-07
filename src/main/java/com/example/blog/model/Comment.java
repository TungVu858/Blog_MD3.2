package com.example.blog.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Comment {
    private int id;
    private User userId;
    private Post postId;
    private LocalDateTime commentDate;
    private int status;
    private String content;
    public Comment() {
    }

    public Comment(User userId, Post postId, LocalDateTime commentDate, int status, String content) {
        this.userId = userId;
        this.postId = postId;
        this.commentDate = commentDate;
        this.status = status;
        this.content = content;
    }

    public Comment(int id, User userId, Post postId, LocalDateTime commentDate, int status, String content) {
        this.id = id;
        this.userId = userId;
        this.postId = postId;
        this.commentDate = commentDate;
        this.status = status;
        this.content = content;
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

    public Post getPostId() {
        return postId;
    }

    public void setPostId(Post postId) {
        this.postId = postId;
    }

    public LocalDateTime getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDateTime commentDate) {
        this.commentDate = commentDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
