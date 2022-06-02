package com.example.blog.service;

import com.example.blog.model.Post;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PostsService implements com.example.blog.service.PostService {
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
                     ("insert into posts (id,userId,title,description,content,date,status) value (?,?,?,?,?,?,?)");) {
            preparedStatement.setInt(1, post.getId());
            preparedStatement.setInt(2, post.getUserId().getId());
            preparedStatement.setString(3, post.getTitle());
            preparedStatement.setString(4, post.getDescription());
            preparedStatement.setString(5, post.getContent());
            preparedStatement.setString(6, String.valueOf(post.getPostDate()));
            preparedStatement.setInt(7, post.getStatus());
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
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("userId");


            }
        } catch (SQLException e) {
        }
        return post;

    }

    @Override
    public List<Post> findAll() {
        List<Post> posts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from posts");) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");

                String description = rs.getString("description");
                String content = rs.getString("content");
                LocalDate localDate = LocalDate.parse(rs.getString("postDate"));
                int status = rs.getInt("status");






//                int id = rs.getInt("id");
//                int age = rs.getInt("age");
//                String name = rs.getString("name");
//                int classId = rs.getInt("cID");
//                Class clazz = classService.findById(classId);
//                students.add(new Student(id,name,age,clazz));

            }
        } catch (SQLException e) {
        }

        return posts;


    }

    @Override
    public List<Post> findByName(String name) {
        return null;
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

        return false;
    }
}
