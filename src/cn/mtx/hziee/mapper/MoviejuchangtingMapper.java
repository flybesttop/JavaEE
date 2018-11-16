package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Moviejuchangting;

import java.util.List;

public interface MoviejuchangtingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Moviejuchangting record);

    int insertSelective(Moviejuchangting record);

    List<Moviejuchangting> selectByPrimaryKey(Integer movieId);

    Moviejuchangting selectById(Integer Id);

    int updateByPrimaryKeySelective(Moviejuchangting record);

    int updateByPrimaryKey(Moviejuchangting record);
}