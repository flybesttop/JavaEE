package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Gouwuche;

import java.util.List;

public interface GouwucheMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteByUsername(String username);

    int insert(Gouwuche record);

    int insertSelective(Gouwuche record);

    Gouwuche selectByPrimaryKey(Integer id);

    List<Gouwuche> selectByUsername(String username);

    int updateByPrimaryKeySelective(Gouwuche record);

    int updateByPrimaryKey(Gouwuche record);

    int updateByIsPay(String username);
}