package com.example.blog.controller;

import com.example.blog.model.Comment;
import com.example.blog.model.Post;
import com.example.blog.model.User;
import com.example.blog.service.impl.CommentServiceImpl;
import com.example.blog.service.impl.PostsServiceImpl;
import com.example.blog.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "CommentServlet", value = "/comments")
public class CommentServlet extends HttpServlet {
    UserServiceImpl userService = new UserServiceImpl();
    PostsServiceImpl postsService = new PostsServiceImpl();
    CommentServiceImpl commentService = new CommentServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "create":
                showCreateComment(request,response);
                break;
            case "search":
                try {
                    showSearchComment(request,response,session);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    showComment(request,response,session);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void showSearchComment(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("comment/comment-detail.jsp");
        int postId = Integer.parseInt(request.getParameter("id"));
        List<Comment> comments = commentService.findByPostID(postId);
        session.setAttribute("comments", comments.size());
        Comment comment = commentService.findById(postId);
        session.setAttribute("idFind",postId);
        if (comment !=null) {
            request.setAttribute("comment", comments);
            session.setAttribute("title",comment.getPostId().getTitle());
            session.removeAttribute(String.valueOf(comments.size()));
            requestDispatcher.forward(request, response);
        }else {
            session.setAttribute("mess","Chưa có phản hồi nào cho bài viết này");
            response.sendRedirect("/posts");
        }
    }

    private void showComment(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("comment/list.jsp");
        List<Comment> comments = commentService.findAll();
//        session.setAttribute("comments",comments);
        request.setAttribute("comment",comments);
        requestDispatcher.forward(request, response);
    }

    private void showCreateComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("comment/create.jsp");
        int postId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("postId", postId);
        requestDispatcher.forward(request,response);
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
            case "create":
                try {
                    createComment(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void createComment(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User user = userService.findById(LoginServlet.currentId);
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post post = postsService.findById(postId);
        LocalDateTime localDate = LocalDateTime.now();
        int status = Integer.parseInt(request.getParameter("status"));
        String content = request.getParameter("content");
        commentService.add(new Comment(user,post,localDate,status,content));
        response.sendRedirect("posts");
    }
}
