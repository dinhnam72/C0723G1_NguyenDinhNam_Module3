package com.example.bt.service;

import com.example.bt.model.Category;
import com.example.bt.repository.CategoryRepository;
import com.example.bt.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    private ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> display() {
        return categoryRepository.display();
    }
}
