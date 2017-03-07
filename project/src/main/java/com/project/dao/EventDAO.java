package com.project.dao;

import java.util.List;

import com.project.vo.EventVO;

public interface EventDAO {
  public int insertEvent(EventVO vo)throws Exception;
  public List<EventVO> listAll()throws Exception;
  public List<EventVO> selectBanner()throws Exception;
}
