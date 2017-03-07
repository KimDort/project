package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.EventDAO;
import com.project.vo.EventVO;

@Service
public class EventServiceImpl implements EventService{
  @Inject
  private EventDAO dao;

  @Override
  public int createEvent(EventVO vo) throws Exception {
    // TODO Auto-generated method stub
    return dao.insertEvent(vo);
  }

  @Override
  public List<EventVO> listAll() throws Exception {
    // TODO Auto-generated method stub
    return dao.listAll();
  }

@Override
public List<EventVO> listBanner() throws Exception {
	// TODO Auto-generated method stub
	return dao.selectBanner();
}

}
