package com.example.bt.repository;

import com.example.bt.model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> display();
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    List<Book> seachrBook(String title);
    Book findById(int checkId);
    List<Book> sort(int sortTitle);
}
