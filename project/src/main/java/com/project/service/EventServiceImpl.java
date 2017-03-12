package com.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.dao.EventDAO;
import com.project.tool.SearchCriteria;
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

@Override
public List<EventVO> listPage(SearchCriteria cri) throws Exception {
	// TODO Auto-generated method stub
	return dao.pageList(cri);
}

@Override
public int countPaging() throws Exception {
	// TODO Auto-generated method stub
	return dao.countPaging();
}

@Override
public int eventDelete(int eno) throws Exception {
	// TODO Auto-generated method stub
	return dao.eventDelete(eno);
}

@Override
public int checkString(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkString(vo);
}

@Override
public int checkClosed(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkClosed(vo);
}

@Override
public int checkDeleted(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkDeleted(vo);
}

@Override
public int checkBanner(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkBanner(vo);
}

@Override
public int checkQuit(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkQuit(vo);
}

@Override
public int checkDisplay(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.checkDisplay(vo);
}

@Override
public EventVO read(int eno) throws Exception {
	// TODO Auto-generated method stub
	return dao.read(eno);
}

@Override
public int modify(EventVO vo) throws Exception {
	// TODO Auto-generated method stub
	return dao.modify(vo);
}

@Override
public int maxNum() throws Exception {
	// TODO Auto-generated method stub
	return dao.maxNum();
}

}
