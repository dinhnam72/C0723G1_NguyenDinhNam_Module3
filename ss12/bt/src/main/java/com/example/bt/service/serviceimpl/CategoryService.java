package com.example.bt.service.serviceimpl;

import com.example.bt.model.Category;
import com.example.bt.repository.repositoryimpl.CategoryRepository;
import com.example.bt.repository.ICategoryRepository;
import com.example.bt.service.ICategoryService;

import java.util.List;

public class CategoryService implements ICategoryService {
    private ICategoryRepository categoryRepository = new CategoryRepository();
    @Override
    public List<Category> display() {
        return categoryRepository.display();
    }
}
