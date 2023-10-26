package com.example.bt.repository;

import com.example.bt.model.Author;
import com.example.bt.model.Book;
import com.example.bt.model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String SELECT = "SELECT * FROM books b  " +
            "JOIN authors a ON b.id_author = a.id_author " +
            "JOIN category c ON b.id_category = c.id_category " +
            "ORDER BY b.id_book";
    private static final String SELECT_ID = "SELECT * FROM books b  " +
            "JOIN authors a ON b.id_author = a.id_author " +
            "JOIN category c ON b.id_category = c.id_category " +
            "WHERE b.id_book=?";
    private static final String CREATE = "CALL sp_insert_book(?,?,?,?);";
    private static final String UPDATE = "CALL sp_update_book(?,?,?,?,?);";
    private static final String DELETE = "CALL sp_delete_book(?);";


    @Override
    public List<Book> display() {
        Connection connection = BaseRepository.getConnection();
        List<Book> bookList = new ArrayList<>();
        Book book = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id_book");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                String categoryName = resultSet.getString("name_category");
                String authorName = resultSet.getString("name_authors");
                book = new Book(id, title, pageSize, new Author(authorName), new Category(categoryName));
                bookList.add(book);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bookList;
    }

    @Override
    public void addBook(Book book) {
        Connection connection = BaseRepository.getConnection();

        try {
            CallableStatement callableStatement = connection.prepareCall(CREATE);
            callableStatement.setInt(1, book.getCategory().getCategoryId());
            callableStatement.setInt(2, book.getAuthor().getAuthorId());
            callableStatement.setString(3, book.getTitle());
            callableStatement.setInt(4, book.getPageSize());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateBook(Book book) {
        Connection connection = BaseRepository.getConnection();

        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE);
            callableStatement.setInt(1, book.getId());
            callableStatement.setInt(2, book.getCategory().getCategoryId());
            callableStatement.setInt(3, book.getAuthor().getAuthorId());
            callableStatement.setString(4, book.getTitle());
            callableStatement.setInt(5, book.getPageSize());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void removeBook(int id) {
        Connection connection = BaseRepository.getConnection();

        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Book> seachrBook(String title) {

        return null;
    }

    @Override
    public Book findById(int checkId) {
        Connection connection = BaseRepository.getConnection();
        Book book = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID);
            preparedStatement.setInt(1, checkId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id_book");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_size");
                int categoryId = resultSet.getInt("id_category");
                String categoryName = resultSet.getString("name_category");
                int authorId = resultSet.getInt("id_author");
                String authorName = resultSet.getString("name_authors");
                book = new Book(id, title, pageSize, new Author(authorId,authorName), new Category(categoryId,categoryName));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return book;
    }
}
