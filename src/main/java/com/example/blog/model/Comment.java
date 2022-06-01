package com.example.blog.model;

import java.time.LocalDate;

public class Comment {
    private int id;
    private User userId;
    private Post postId;
    private LocalDate commentDate;
    private int status;

    public Comment() {
    }

    public Comment(int id, User userId, Post postId, LocalDate commentDate, int status) {
        this.id = id;
        this.userId = userId;
        this.postId = postId;
        this.commentDate = commentDate;
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

    public Post getPostId() {
        return postId;
    }

    public void setPostId(Post postId) {
        this.postId = postId;
    }

    public LocalDate getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDate commentDate) {
        this.commentDate = commentDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
