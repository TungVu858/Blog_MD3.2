package com.example.blog.service;

import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.service.impl.UserServiceImpl;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class PostsService implements com.example.blog.service.PostService {
    UserServiceImpl userService = new UserServiceImpl();

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
    public void add(Post post) throws SQLException {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement
                     ("insert into posts (userId,title,description,content,date,status) value (?,?,?,?,?,?)");) {
            preparedStatement.setInt(1, post.getUserId().getId());
            preparedStatement.setString(2, post.getTitle());
            preparedStatement.setString(3, post.getDescription());
            preparedStatement.setString(4, post.getContent());
            preparedStatement.setString(5, String.valueOf(post.getPostDate()));
            preparedStatement.setInt(6, post.getStatus());
            preparedStatement.executeUpdate();
            System.out.println(preparedStatement);

        } catch (SQLException e) {
        }
    }

    @Override
    public Post findById(int id) throws SQLException {
        Post post = new Post();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts where id = ?");) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                String title = rs.getString("title");
                String description = rs.getString("description");
                String content = rs.getString("content");
                String time = rs.getString("date");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                post = new Post(id, user, title, description, content, dateTime, status);
            }
        } catch (SQLException e) {
        }
        return post;
    }

    @Override
    public List<Post> findAll() {
        List<Post> posts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts")) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                String description = rs.getString("description");
                String content = rs.getString("content");

                String time = rs.getString("date");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);

                int status = rs.getInt("status");
                posts.add(new Post(id, user, title, description, content, dateTime, status));
            }
        } catch (SQLException e) {
        }
        return posts;
    }

    @Override
    public List<Post> findByName(String title) {
        List<Post> posts = new ArrayList<>();

        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts where title like ?");) {
            preparedStatement.setString(1, "%" + title + "%");
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String titleFind = rs.getString("title");
                int userId = rs.getInt("userId");
                User user = userService.findById(userId);
                String description = rs.getString("description");
                String content = rs.getString("content");
                String time = rs.getString("date");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                posts.add(new Post(id, user, titleFind, description, content, dateTime, status));

            }
        } catch (SQLException e) {
        }
        return posts;
    }

    public List<Post> findByUserId(int userId) {
        List<Post> postList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts where userId?");) {
            preparedStatement.setInt(1, userId);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
//                int userId = rs.getInt("userId");
                User userid = userService.findById(userId);
                String description = rs.getString("description");
                String content = rs.getString("content");
                String time = rs.getString("date");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                postList.add(new Post(id, userid, title, description, content, dateTime, status));
            }
        } catch (SQLException e) {
        }
        return postList;
    }


    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("delete from posts where id=?");) {
            statement.setInt(1, id);
            System.out.println(statement);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;

    }

    @Override
    public boolean update(Post post) throws SQLException {
        boolean update;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = getConnection().prepareStatement("update posts set userId = ? , title = ?, description=?,content= ?, date =?,status=?  where id = ?");) {
            preparedStatement.setInt(1, post.getUserId().getId());
            preparedStatement.setString(2, post.getTitle());
            preparedStatement.setString(3, post.getDescription());
            preparedStatement.setString(4, post.getContent());
            preparedStatement.setString(5, String.valueOf(post.getPostDate()));
            preparedStatement.setInt(6, post.getStatus());
            preparedStatement.setInt(7, post.getId());

            update = preparedStatement.executeUpdate() > 0;
        }
        return update;
    }

    public List<Post> findTop6PostTime() {
        List<Post> postList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts oder by postDate");) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                int userId = rs.getInt("userId");
                User userid = userService.findById(userId);
                String description = rs.getString("description");
                String content = rs.getString("content");
                String time = rs.getString("date");
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                int status = rs.getInt("status");
                postList.add(new Post(id, userid, title, description, content, dateTime, status));
            }
        } catch (SQLException e) {

        }
        return postList;
    }

}
