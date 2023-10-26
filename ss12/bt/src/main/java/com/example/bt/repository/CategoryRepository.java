package com.example.bt.repository;

import com.example.bt.model.Category;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    private static final String SELECT_CATEGORY = "SELECT * FROM category";
    @Override
    public List<Category> display() {
        Connection connection = BaseRepository.getConnection();
        List<Category> categoryList = new ArrayList<>();
        Category category = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_CATEGORY);
            while (resultSet.next()){
                int categoryId = resultSet.getInt("id_category");
                String categoryName = resultSet.getString("name_category");
                category= new Category(categoryId,categoryName);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return categoryList;
    }
}
