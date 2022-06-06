package com.example.blog.controller;

import com.example.blog.model.Post;
import com.example.blog.service.impl.PostsServiceImpl;
import com.example.blog.service.impl.RoleServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PostDetailServlet", value = "/post-details")
public class PostDetailServlet extends HttpServlet {
    PostsServiceImpl postsServiceImpl = new PostsServiceImpl();
    RoleServiceImpl roleService = new RoleServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession httpSession = request.getSession();
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                try {
                    showPostDetail(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void showPostDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/post-detail.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postsServiceImpl.findById(id);
        request.setAttribute("post", post);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
