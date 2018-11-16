package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Context;

import java.util.List;
import java.util.Map;

public interface ContextMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Context record);

    int insertSelective(Context record);

    List<Context> selectByPrimaryKey(Integer movieId);

    List<Context> selectByPrimaryKeyMAP(Map map);

    int updateByPrimaryKeySelective(Context record);

    int updateByPrimaryKey(Context record);
}