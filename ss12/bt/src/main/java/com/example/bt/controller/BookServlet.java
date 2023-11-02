package com.example.bt.controller;

import com.example.bt.model.Author;
import com.example.bt.model.Book;
import com.example.bt.model.Category;
import com.example.bt.service.*;
import com.example.bt.service.serviceimpl.AuthorService;
import com.example.bt.service.serviceimpl.BookService;
import com.example.bt.service.serviceimpl.CategoryService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private IBookService bookService = new BookService();
    private ICategoryService categoryService = new CategoryService();
    private IAuthorService authorService = new AuthorService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "sort":
                sort(request,response);
                break;
            case "create":
                formCreate(request,response);
            case "update":
                formUpdate(request,response);
                break;
            default:
                display(request,response);
        }
    }

    private void sort(HttpServletRequest request, HttpServletResponse response) {
        int sort = Integer.parseInt(request.getParameter("sort"));

        request.setAttribute("bookList",bookService.sort(sort));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void formCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("category",categoryService.display());
        request.setAttribute("author",authorService.display());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
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
        request.setAttribute("category",categoryService.display());
        request.setAttribute("author",authorService.display());
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
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int authorId = Integer.parseInt(request.getParameter("author"));
        int categoryId = Integer.parseInt(request.getParameter("category"));
        Book book = new Book(title,pageSize,new Author(authorId),new Category(categoryId));
        bookService.addBook(book);
        display(request,response);

    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int authorId = Integer.parseInt(request.getParameter("author"));
        int categoryId = Integer.parseInt(request.getParameter("category"));
        Book book = new Book(id,title,pageSize,new Author(authorId),new Category(categoryId));
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
