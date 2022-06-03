package com.example.blog.controller;

import com.example.blog.model.Role;
import com.example.blog.model.User;
import com.example.blog.service.impl.RoleServiceImpl;
import com.example.blog.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();
    RoleServiceImpl roleService = new RoleServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                try {
                    delete(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "unlock":
                try {
                    unlock(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showUserForm(request, response);
        }

    }

    private void unlock(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.unlock(userService.findById(id));
        response.sendRedirect("/users");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user/edit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        request.setAttribute("users", user);
        requestDispatcher.forward(request, response);
    }


    private void showUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/list.jsp");
        List<User> users = userService.findAll();
        request.setAttribute("users", users);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                try {
                    edit(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(userService.findById(id));
        response.sendRedirect("/users");
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int status = Integer.parseInt(request.getParameter("status"));
        userService.update(new User(id,password, name,email,status));
        response.sendRedirect("/users");
    }
}
