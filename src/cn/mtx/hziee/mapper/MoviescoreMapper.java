package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Moviescore;

import java.util.List;
import java.util.Map;

public interface MoviescoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Moviescore record);

    int insertSelective(Moviescore record);

    Moviescore selectByPrimaryKey(Integer id);

    Moviescore selectByMovieIdAndUsername(Map map);

    List<Moviescore> selectByMovieId(Integer movieId);

    List<Moviescore> selectAll();

    int updateByPrimaryKeySelective(Moviescore record);

    int updateByPrimaryKey(Moviescore record);
}