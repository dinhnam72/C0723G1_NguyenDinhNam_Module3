package com.example.bt.service.serviceimpl;

import com.example.bt.model.Author;
import com.example.bt.repository.repositoryimpl.AuthorRepository;
import com.example.bt.repository.IAuthorRepository;
import com.example.bt.service.IAuthorService;

import java.util.List;

public class AuthorService implements IAuthorService {
    private IAuthorRepository authorRepository = new AuthorRepository();
    @Override
    public List<Author> display() {
        return authorRepository.display();
    }
}
