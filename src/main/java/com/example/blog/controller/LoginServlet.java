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

@WebServlet(name = "LoginServlet", value = "/logins")
public class LoginServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();
    RoleServiceImpl roleService = new RoleServiceImpl();
    static int currentId =0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                showViewUser(request,response);
                break;
            case "logout":
                logout(request,response,session);
                break;
            default:
                showLoginForm(request, response);
        }
    }
    private void showViewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = userService.findById(currentId);
        request.setAttribute("users", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("login/login.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                try {
                    login(request, response, session);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "view":
                try {
                    editUser(request,response,session);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }
    private void editUser(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException, SQLException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        Role role = roleService.findById(roleId);
        int status = Integer.parseInt(request.getParameter("status"));
        userService.update(new User(currentId,username,password,name,email,role,status));
        session.setAttribute("name", name);
        session.setAttribute("email",email);
        session.setAttribute("password",password);
        response.sendRedirect("/");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        if (session.getAttribute("name")!=null){
            session.invalidate();
        }
            currentId = 0;
            response.sendRedirect("/");
    }

    private void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.findByUserNamePassword(username , password);
        if(user == null){
                request.setAttribute("mess", "Nhập sai tài khoản hoặc mật khẩu");
                request.getRequestDispatcher("login/login.jsp").forward(request,response);
        } else {
            if (user.getStatus()==2){
                request.setAttribute("mess1", "Tài khoản của bạn đã bị khoá");
                request.getRequestDispatcher("login/login.jsp").forward(request,response);
            }
            else {
                session.setAttribute("email", user.getEmail());
                session.setAttribute("name", user.getName());
                session.setAttribute("username",user.getUsername());
                session.setAttribute("roleId", user.getRoleId().getId());
                session.setAttribute("userId", user.getId());
                currentId = user.getId();
                response.sendRedirect("/");
            }
        }
    }
}
