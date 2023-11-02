package com.example.bt.service.serviceimpl;

import com.example.bt.model.Book;
import com.example.bt.repository.repositoryimpl.BookRepository;
import com.example.bt.service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    private BookRepository bookRepository = new BookRepository();
    @Override
    public List<Book> display() {
        return bookRepository.display();
    }

    @Override
    public void addBook(Book book) {
        bookRepository.addBook(book);

    }

    @Override
    public void updateBook(Book book) {
        bookRepository.updateBook(book);
    }

    @Override
    public void removeBook(int id) {
        bookRepository.removeBook(id);
    }

    @Override
    public List<Book> searchBook(String title) {
        return bookRepository.seachrBook(title);
    }

    @Override
    public Book findById(int id) {
        return bookRepository.findById(id);
    }

    @Override
    public List<Book> sort(int sortTitle) {
        return bookRepository.sort(sortTitle);
    }
}
