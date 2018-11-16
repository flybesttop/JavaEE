package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Movietype;

import java.util.List;

public interface MovietypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Movietype record);

    int insertSelective(Movietype record);

    Movietype selectByPrimaryKey(Integer id);

    List<Movietype> selectByType(Integer typeid);

    int updateByPrimaryKeySelective(Movietype record);

    int updateByPrimaryKey(Movietype record);
}