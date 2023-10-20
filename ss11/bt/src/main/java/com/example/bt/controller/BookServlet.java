package com.example.bt.controller;

import com.example.bt.model.Book;
import com.example.bt.service.BookService;
import jdk.nashorn.internal.ir.IfNode;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private BookService bookService = new BookService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "update":
                formUpdate(request,response);
            default:
                display(request,response);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("bookList",bookService.display());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void formUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookService.findById(id);
        request.setAttribute("book",book);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("update.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "update":
                update(request,response);
                break;
            case "remove":
                remove(request,response);
                break;
            case "search":
                search(request,response);
                break;
            default:
                display(request,response);
        }
    }



    private void create(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("category");
        String category = request.getParameter("category");
        Book book = new Book(id,title,pageSize,author,category);
        bookService.addBook(book);
        display(request,response);

    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("category");
        String category = request.getParameter("category");
        Book book = new Book(id,title,pageSize,author,category);
        bookService.updateBook(book);
        display(request,response);

    }
    private void remove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        bookService.removeBook(id);
        display(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
       request.setAttribute("books",bookService.searchBook(title));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
