package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.tool.SearchCriteria;
import com.project.vo.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {
	@Inject
	private SqlSession session;

	@Override
	public int insertEvent(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("com.mapper.event.insertEvent", vo);
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

	@Override
	public List<EventVO> pageList(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("com.mapper.event.listPage", cri);
	}

	@Override
	public int countPaging() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.event.countPaging");
	}

	@Override
	public int eventDelete(int eno) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("com.mapper.event.eventDelete", eno);
	}

	@Override
	public int checkString(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.strong", vo);
	}

	@Override
	public int checkClosed(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.closed", vo);
	}

	@Override
	public int checkDeleted(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.deleted", vo);
	}

	@Override
	public int checkBanner(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.banner", vo);
	}

	@Override
	public int checkQuit(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.quit", vo);
	}

	@Override
	public int checkDisplay(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.display", vo);
	}

	@Override
	public EventVO read(int eno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.event.read",eno);
	}

	@Override
	public int modify(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.update("com.mapper.event.eventUpdate",vo);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("com.mapper.event.maxNum");
	}

}
