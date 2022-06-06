package com.example.blog.controller;

import com.example.blog.model.Post;
import com.example.blog.service.impl.PostsServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    PostsServiceImpl postsServiceImpl = new PostsServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            default:
                showHome(request, response);
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        if (LoginServlet.currentId==0){
            List<Post> posts = postsServiceImpl.findTop6PostTimeOff();
            request.setAttribute("posts", posts);
            requestDispatcher.forward(request, response);
        }else {
            List<Post> posts = postsServiceImpl.findTop6PostTime();
            request.setAttribute("post", posts);
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
