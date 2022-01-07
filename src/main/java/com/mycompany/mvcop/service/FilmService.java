package com.mycompany.mvcop.service;


import com.mycompany.mvcop.model.Film;
import java.util.List;

public interface FilmService {
    List<Film> allFilms(int page);
    void add(Film film);
    void delete(Film film);
    void edit(Film film);
    Film getById(int id);
    void deleteByCheck(Integer[] id);

    int filmsCount();

    boolean checkTitle(String title);
}
