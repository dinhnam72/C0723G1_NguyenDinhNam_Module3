package com.example.bt.repository;

import com.example.bt.model.Author;
import com.example.bt.model.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorRepository implements IAuthorRepository{
    private static final String SELECT_AUTHOR = "SELECT * FROM authors";
    @Override
    public List<Author> display() {
        Connection connection = BaseRepository.getConnection();
        List<Author> authorList = new ArrayList<>();
        Author author = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_AUTHOR);
            while (resultSet.next()){
                int authorId = resultSet.getInt("id_author");
                String authorname = resultSet.getString("name_authors");
                author= new Author(authorId,authorname);
                authorList.add(author);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return authorList;

    }
}
