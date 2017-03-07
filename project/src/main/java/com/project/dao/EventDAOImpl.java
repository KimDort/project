package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.vo.EventVO;

@Repository
public class EventDAOImpl implements EventDAO{
  @Inject
  private SqlSession session;

  @Override
  public int insertEvent(EventVO vo) throws Exception {
    // TODO Auto-generated method stub
    return session.insert("com.mapper.event.insertEvent",vo);
  }

  @Override
  public List<EventVO> listAll() throws Exception {
    // TODO Auto-generated method stub
    return session.selectList("com.mapper.event.allList");
  }

@Override
public List<EventVO> selectBanner() throws Exception {
	// TODO Auto-generated method stub
	return session.selectList("com.mapper.event.selectBanner");
}

}
