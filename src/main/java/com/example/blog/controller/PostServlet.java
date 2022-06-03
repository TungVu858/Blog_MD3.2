package com.example.blog.controller;

import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.service.PostsService;
import com.example.blog.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {
   PostsService postsService = new PostsService();
   UserServiceImpl userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            case " search":
                search(request,response);
                break;
            default :
                showPost(request,response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String uId= request.getParameter("userId");
        String title = request.getParameter("title");
        List<Post> postList = postsService.findAll();
        if(title!=null){
            postList = postsService.findByName(title);
        }
        if(uId!=null){
            postList = postsService.findByUserId(Integer.parseInt(uId));
        }
        request.setAttribute("posts",postList);

    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Post post = postsService.findById(id);
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
        postsService.add(new Post(user,title,description,content,localDate,status));
        response.sendRedirect("index.jsp");
    }

    private void showPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("blog/post.jsp");
        List<Post> posts = postsService.findAll();
        String title = request.getParameter("title");
        if(title!=null){
            posts = postsService.findByName(title);
        }
        String uId= request.getParameter("userId");

        if(uId!=null){
            posts = postsService.findByUserId(Integer.parseInt(uId));
        }
        request.setAttribute("post",posts);
        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        postsService.update(new Post(id,user,title,description,content,localDate,status));
        response.sendRedirect("/posts");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        postsService.delete(id);
        response.sendRedirect("/posts");

    }
}
