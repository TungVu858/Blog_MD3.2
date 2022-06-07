package com.example.blog.service.impl;

import com.example.blog.model.Comment;
import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.service.CommentService;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CommentServiceImpl implements CommentService {
    UserServiceImpl userService = new UserServiceImpl();
    PostsServiceImpl postsService = new PostsServiceImpl();

    protected Connection getConnection() {
        Connection connection = null;
        try {
            java.lang.Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useSSL=false", "root", "123456");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void add(Comment comment) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement
                     ("insert into comment (userId,postsId,commentDate,status,content) value (?,?,?,?,?)");) {
            preparedStatement.setInt(1, comment.getUserId().getId());
            preparedStatement.setInt(2, comment.getPostId().getId());
            preparedStatement.setString(3, String.valueOf(comment.getCommentDate()));
            preparedStatement.setInt(4, comment.getStatus());
            preparedStatement.setString(5, comment.getContent());
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement);

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    @Override
    public Comment findById(int postsID) throws SQLException {
        Comment comments = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from comment where postsId = ? order by postsId desc ")) {
            preparedStatement.setInt(1,postsID);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                int postId = rs.getInt("postsId");
                Post post = postsService.findById(postId);
                String time = rs.getString("commentDate");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                String content = rs.getString("content");
                comments =new Comment(id, user, post, dateTime, status, content);
            }
        } catch (SQLException e) {
        }
        return comments;
    }

    public List<Comment> findByPostID(int postsID) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from comment where postsId = ? order by postsId desc ")) {
            preparedStatement.setInt(1,postsID);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                int postId = rs.getInt("postsId");
                Post post = postsService.findById(postId);
                String time = rs.getString("commentDate");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                String content = rs.getString("content");
                comments.add(new Comment(id, user, post, dateTime, status, content));
            }
        } catch (SQLException e) {
        }
        return comments;
    }

    @Override
    public List<Comment> findAll() {
        List<Comment> comments = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from comment  group by postsId order by commentDate desc  ")) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                int postId = rs.getInt("postsId");
                Post post = postsService.findById(postId);
                String time = rs.getString("commentDate");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                String content = rs.getString("content");
                comments.add(new Comment(id, user, post, dateTime, status, content));
            }
        } catch (SQLException e) {
        }
        return comments;
    }

    @Override
    public List<Comment> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Comment comment) throws SQLException {
        return false;
    }
}
