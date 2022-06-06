package com.example.blog.controller;

import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.service.impl.PostsServiceImpl;
import com.example.blog.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {
   PostsServiceImpl postsServiceImpl = new PostsServiceImpl();
   UserServiceImpl userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case"create":
                showCreateForm(request,response);
                break;
            case "edit":
                try {
                    showEdit(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    delete(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "searchTime":
                search(request,response);
                break;
            default :
                showPost(request,response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/post.jsp");
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

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postsServiceImpl.findById(id);
        request.setAttribute("post",post);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/edit.jsp");
        requestDispatcher.forward(request,response);
        response.sendRedirect("/posts");


    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/create.jsp");
        requestDispatcher.forward(request,response);


    }

    private void createForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User user = userService.findById(LoginServlet.currentId);
        String title = request.getParameter("title");
        String description =request.getParameter("description");
        String content =request.getParameter("content");
        LocalDateTime localDate = LocalDateTime.now();
        int status = Integer.parseInt(request.getParameter("status"));
        postsServiceImpl.add(new Post(user,title,description,content,localDate,status));
        response.sendRedirect("/");
    }

    private void showPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/post.jsp");
        if (LoginServlet.currentId!=0) {
            List<Post> posts = postsServiceImpl.findAll();
            String title = request.getParameter("title");
            if (title != null) {
                posts = postsServiceImpl.findByName(title);
            }
            String uId = request.getParameter("userId");
            if (uId != null) {
                posts = postsServiceImpl.findByUserId(Integer.parseInt(uId));
            }
            request.setAttribute("post", posts);
            requestDispatcher.forward(request, response);
        }else {
            List<Post> posts = postsServiceImpl.findAllOff();
            String title = request.getParameter("title");
            if (title != null) {
                posts = postsServiceImpl.findByName(title);
            }
            String uId = request.getParameter("userId");
            if (uId != null) {
                posts = postsServiceImpl.findByUserId(Integer.parseInt(uId));
            }
            request.setAttribute("posts", posts);
            requestDispatcher.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case"create":
                try {
                    createForm(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    delete(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    edit(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User user = userService.findById(LoginServlet.currentId);
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description =request.getParameter("description");
        String content =request.getParameter("content");
        LocalDateTime localDate = LocalDateTime.now();
        int status = Integer.parseInt(request.getParameter("status"));
        postsServiceImpl.update(new Post(id,user,title,description,content,localDate,status));
        response.sendRedirect("/posts");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        postsServiceImpl.delete(id);
        response.sendRedirect("/posts");

    }
}
