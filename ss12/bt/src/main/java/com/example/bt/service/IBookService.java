package com.example.bt.service;

import com.example.bt.model.Book;

import java.util.List;

public interface IBookService {
    List<Book> display();
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    List<Book> searchBook(String title);
    Book findById(int id);
    List<Book> sort(int sortTitle);
}
