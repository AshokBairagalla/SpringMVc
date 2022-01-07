package com.mycompany.mvcop.service;

import com.mycompany.mvcop.controller.StringUtil;
import com.mycompany.mvcop.dao.BaseDao;
import com.mycompany.mvcop.dao.FilmDAO;
import com.mycompany.mvcop.model.Film;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FilmServiceImpl extends BaseDao implements FilmService {

    private FilmDAO filmDAO;

    @Autowired
    public void setFilmDAO(FilmDAO filmDAO) {
        this.filmDAO = filmDAO;
    }

    @Override
    @Transactional
    public List<Film> allFilms(int page) {
        return filmDAO.allFilms(page);
    }

    @Override
    @Transactional
    public void add(Film film) {
        filmDAO.add(film);
    }

    @Override
    @Transactional
    public void delete(Film film) {
        filmDAO.delete(film);
    }

    @Override
    @Transactional
    public void edit(Film film) {
        filmDAO.edit(film);
    }

    @Override
    @Transactional
    public Film getById(int id) {
        return filmDAO.getById(id);
    }

    @Override
    @Transactional
    public int filmsCount() {
        return filmDAO.filmsCount();
    }

    @Override
    @Transactional
    public boolean checkTitle(String title) {
        return filmDAO.checkTitle(title);
    }

    @Override
    public void deleteByCheck(Integer[] intgrs) {
        String bulk = StringUtil.toCommaSeperatedString(intgrs);
        String sql = "Delete from films where id in (" + bulk + ")";
        getJdbcTemplate().execute(sql);
    }

}
