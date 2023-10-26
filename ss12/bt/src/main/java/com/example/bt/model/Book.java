package com.example.bt.model;

public class Book {
    private int id;
    private String title;
    private int pageSize;
    private Author author;
    private Category category;

    public Book(int id, String title, int pageSize, Author author, Category category) {
        this.id = id;
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public Book(String title, int pageSize, Author author, Category category) {
        this.title = title;
        this.pageSize = pageSize;
        this.author = author;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
