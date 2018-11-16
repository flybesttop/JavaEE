package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Movie;

import java.util.List;
import java.util.Map;

public interface MovieMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Movie record);

    int insertSelective(Movie record);

    Movie selectByPrimaryKey(Integer id);

    List<Movie> selectAllmovie(Map map);

    List<Movie> selectAll();

    List<Movie> selectShowingMovie(Integer num);

    List<Movie> selectnicemovie(Integer num);

    List<Movie> selectBylikelyname(String moviename);

    Movie selectBylikelyName(String id);

    int updateByPrimaryKeySelective(Movie record);

    int updateByPrimaryKey(Movie record);
}