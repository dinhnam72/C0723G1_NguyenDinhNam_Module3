package com.example.bt.service;

import com.example.bt.model.Author;
import com.example.bt.model.Category;
import com.example.bt.repository.AuthorRepository;
import com.example.bt.repository.IAuthorRepository;

import java.util.List;

public class AuthorService implements IAuthorService{
    private IAuthorRepository authorRepository = new AuthorRepository();
    @Override
    public List<Author> display() {
        return authorRepository.display();
    }
}
