package com.example.bt.repository;

import com.example.bt.model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository{
    private static List<Book> bookList = new ArrayList<>();
    static {
        Book book1= new Book(1,"Ngày Nắng",120,"Trần Văn A","Truyện Ma");
        Book book2= new Book(2,"Ngày Mưa",220,"Trần Hoàng La","Truyện Huyền Huyễn");
        Book book3= new Book(3,"Con Chó",400,"Đường La Tam Thiếu","Truyện Tu Tiên");
        Book book4= new Book(4,"Đấu La Đại Lục",540,"Minh Minh","Truyện Tiên Hiệp");
        bookList.add(book4);
        bookList.add(book1);
        bookList.add(book3);
        bookList.add(book2);
    }
    @Override
    public List<Book> display() {
        return bookList;
    }

    @Override
    public void addBook(Book book) {
        bookList.add(book);
    }

    @Override
    public void updateBook(Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId()== book.getId()){
                bookList.set(i,book);
            }
        }
    }

    @Override
    public void removeBook(int id) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId()==id){
                bookList.remove(i);
            }
        }
    }

    @Override
    public List<Book> seachrBook(String title) {
        List<Book> books = new ArrayList<>();
        for (Book book:bookList){
            if (book.getTitle().contains(title)){
                books.add(book);
            }
        }
        return books;
    }

    @Override
    public Book findById(int id) {
        int index=0;
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId()==id){
              index = i;
            }
        }
        return bookList.get(index);
    }
}
