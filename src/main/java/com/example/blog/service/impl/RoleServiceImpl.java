package com.example.blog.service.impl;

import com.example.blog.model.Role;
import com.example.blog.service.RoleService;

import java.sql.*;
import java.util.List;


public class RoleServiceImpl implements RoleService {
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useSSL=false", "root", "123456");
        } catch (SQLException e) {

        } catch (ClassNotFoundException e) {

        }
        return connection;
    }
    @Override
    public void add(Role role) throws SQLException {

    }

    @Override
    public Role findById(int id) throws SQLException {
        Role role = new Role();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select id,name from role where id=?");) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                role = new Role(id, name);
            }
        } catch (SQLException e) {

        }
        return role;
    }

    @Override
    public List<Role> findAll() {
        return null;
    }

    @Override
    public List<Role> findByName(String name) {
        return null;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean update(Role role) throws SQLException {
        return false;
    }
}
