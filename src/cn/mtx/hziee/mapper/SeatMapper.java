package cn.mtx.hziee.mapper;

import cn.mtx.hziee.model.Seat;

import java.util.List;
import java.util.Map;

public interface SeatMapper {
    int deleteByPrimaryKey(Integer id);

    int deleteBySeatId(Map map);

    int deleteByUsername(String username);

    int insert(Seat record);

    int insertSelective(Seat record);

    Seat selectByPrimaryKey(Integer id);

    List<Seat> selectByMovieTingmuId(Integer movieTingmuId);

    int updateByPrimaryKeySelective(Seat record);

    int updateByPrimaryKey(Seat record);
}