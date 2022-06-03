package com.example.blog.service.impl;

import com.example.blog.model.Role;
import com.example.blog.model.User;
import com.example.blog.service.UserService;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.sql.DriverManager.getConnection;

public class UserServiceImpl implements UserService {
    RoleServiceImpl roleService = new RoleServiceImpl();
    public UserServiceImpl() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useSSL=false", "root", "1234");
        } catch (SQLException e) {

        } catch (ClassNotFoundException e) {

        }
        return connection;
    }
    @Override
    public void add(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into user(username,password,name,email,roleId,status ) values (?,?,?,?,?,? )");) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3,user.getName());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setInt(5,user.getRoleId().getId());
            preparedStatement.setInt(6,user.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {

        }

    }

    @Override
    public User findById(int id) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where id =?");) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                int roleId = rs.getInt("roleId");
                Role role = roleService.findById(roleId);
                int status = rs.getInt("status");
                user = new User(id, username, password,name,email,role,status);
            }
        } catch (SQLException e) {
        }
        return user;
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where (roleId=2)" );) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                int roleId = rs.getInt("roleId");
                Role role = roleService.findById(roleId);
                int status = rs.getInt("status");
                users.add(new User(id, username, password,name,email,role,status));
            }
        } catch (SQLException e) {

        }
        return users;
    }


    @Override
    public List<User> findByName(String name) {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where (roleId=2) and name like ? ");) {
            preparedStatement.setString(1, '%'+name+'%');
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String nameFind = rs.getString("name");
                String email = rs.getString("email");
                int roleId = rs.getInt("roleId");
                Role role = roleService.findById(roleId);
                int status = rs.getInt("status");
                users.add(new User(id,username,password,nameFind,email,role,status));
            }
        } catch (SQLException e) {

        }
        return users;
    }

    public List<User> findByUserName(String name) {
        List<User> user = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username = ?; ");) {
            preparedStatement.setString(1, name);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String usernameFind = rs.getString("username");
                String password = rs.getString("password");
                String nameFind = rs.getString("name");
                String email = rs.getString("email");
                int roleId = rs.getInt("roleId");
                Role role = roleService.findById(roleId);
                int status = rs.getInt("status");
                user.add(new User(id,usernameFind,password,nameFind,email,role,status));
                return user;
            }
        } catch (SQLException e) {

        }
        return null;
    }
    @Override
    public boolean delete(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement("delete from user where id=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean delete(User user) throws SQLException{
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("update user set status=2 where id=?;");) {
            preparedStatement.setInt(1, user.getId());
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    @Override
    public boolean update(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("update user set password=?,name=?,email =? where id=?;");) {
            preparedStatement.setString(1,user.getPassword());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean unlock(User user) throws SQLException {
        boolean rowUnlock;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("update user set status=1 where id=?;");) {
            preparedStatement.setInt(1, user.getId());
            rowUnlock = preparedStatement.executeUpdate() > 0;
        }
        return rowUnlock;
    }
    public User findByUserNamePassword(String username,String password) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user where username like ? and password like ?");) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2,password);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String usr = rs.getString("username");
                String pw = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                int roleId = rs.getInt("roleId");
                Role role = roleService.findById(roleId);
                int status = rs.getInt("status");
                user = new User(id, usr, pw,name,email,role,status);
            }
        } catch (SQLException e) {
        }
        return user;
    }
}
